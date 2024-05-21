import {Injectable} from "@angular/core";
import {Unit, UnitType} from "../models/Unit";
import {environment} from "../environments/environment";
import {
  BaseDto,
  ServerAuthenticatesUserDto,
  ServerShowsUnitsDto,
  ServerShowsHistoryDto,
  ServerDeAuthenticatesUserDto
} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";
import {UserModel} from "../models/UserModel";
import {Router} from "@angular/router";
import {BehaviorSubject, combineLatest, map, Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})

export class State {
  private authenticated: boolean = false;
  currentUser?: UserModel;
  jwt?: string | null = localStorage.getItem('jwt');
  currentUserId?: string | null = localStorage.getItem('currentUserId');
  ws: WebSocket = new WebSocket(environment.websocketBaseUrl);

  history$: BehaviorSubject<HistoryModel[]> = new BehaviorSubject<HistoryModel[]>([]);
  units$: BehaviorSubject<Unit[]> = new BehaviorSubject<Unit[]>([]);

  constructor(private router: Router) {
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received", messageFromServer);
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    var current = this.history$.getValue();
    this.history$.next([...current, ...dto.historyList]);
  }

  ServerAuthenticatesUser(dto: ServerAuthenticatesUserDto) {
    if (dto.user !== null && dto.jwt !== null) {
      this.authenticated = true;
      this.currentUser = dto.user;
      this.jwt = dto.jwt;
      localStorage.setItem('jwt', this.jwt);
      localStorage.setItem('currentUserId', this.currentUser.mail);
      this.router.navigateByUrl('');
    }
    else {
      this.router.navigateByUrl('/login');
    }
    this.getUnitsFromServer();
    this.getHistoryFromServer();
  }

  private getUnitsFromServer() {
    var dto = {
      eventType: "ClientWantsToSeeUnits"
    }
    this.ws.send(JSON.stringify(dto));
  }

  private getHistoryFromServer() {
    var dto = {
      eventType: "ClientWantsToSeeHistory"
    }
    this.ws.send(JSON.stringify(dto));
  }

  ServerDeAuthenticatesUser(dto: ServerDeAuthenticatesUserDto) {
    this.authenticated = false;
    this.currentUser = undefined;
    this.units$ = new BehaviorSubject<Unit[]>([]);
    this.history$ = new BehaviorSubject<HistoryModel[]>([]);
    this.router.navigateByUrl('/login');
  }

  ServerShowsUnits(dto: ServerShowsUnitsDto) {
    var current = this.units$.getValue();
    this.units$.next([...current, ...dto.unitList]);
  }

  public getAllHistory(): Observable<HistoryModel[]> {
    return this.history$.asObservable();
  }

  public getUnitHistory(unitId: number): Observable<HistoryModel[]> {
    return this.history$.pipe(map((history) => history.filter((historyModel) => historyModel.unitId === unitId)));
  }

  public getDoors(): Observable<Unit[]> {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitType === UnitType.Doors)));
  }

  public getWindows() {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitType === UnitType.Windows)));
  }

  public getMotionSensor() {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitType === UnitType.MotionSensor)));
  }

  public AuthenticateWithJwt() {
    var dto = {
      eventType: "ClientAuthenticateWithJwt",
      jwt: this.jwt,
      user: this.currentUserId
    }
    this.ws.send(JSON.stringify(dto));
  }
}
