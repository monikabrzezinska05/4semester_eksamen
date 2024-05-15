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
    console.log("something happened before connect");
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received", messageFromServer);
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }

    this.ws.onopen = () => {
      /*console.log("connection opened");
      console.log("jwt", this.jwt);
      if (this.jwt !== null || this.jwt !== undefined) {
        this.AuthenticateWithJwt();
      }*/
    }
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    var current = this.history$.getValue();
    this.history$.next([...current, ...dto.responseDto.responseData]);
  }

  ServerAuthenticatesUser(dto: ServerAuthenticatesUserDto) {
    if (dto.responseDto.responseData !== null && dto.responseDto.jwt !== null) {
      this.authenticated = true;
      this.currentUser = dto.responseDto.responseData;
      console.log("authentication happened in frontend");
      this.jwt = dto.responseDto.jwt;
      localStorage.setItem('jwt', this.jwt);
      localStorage.setItem('currentUserId', this.currentUser.mail);
      this.router.navigateByUrl('');
      var getUnitsDto = {
        eventType: "ClientWantsToSeeUnits"
      }
      this.ws.send(JSON.stringify(getUnitsDto))
    }
    else {
      console.log("authentication failed in frontend");
      this.router.navigateByUrl('/login');
    }
  }

  ServerDeAuthenticatesUser(dto: ServerDeAuthenticatesUserDto) {
    this.authenticated = false;
    this.currentUser = undefined;
    this.units$ = new BehaviorSubject<Unit[]>([]);
    this.history$ = new BehaviorSubject<HistoryModel[]>([]);
    this.router.navigateByUrl('/login');
    console.log(" has happened deauthentication in frontend");
  }

  ServerLogsOffUser(dto: ServerDeAuthenticatesUserDto) {
    this.ws.close();
  }

  ServerShowsUnits(dto: ServerShowsUnitsDto) {
    var current = this.units$.getValue();
    this.units$.next([...current, ...dto.responseDto.responseData]);
  }

  public getAllHistory(): Observable<HistoryModel[]> {
    return this.history$.asObservable();
  }

  public getUnitHistory(unitId: number): Observable<HistoryModel[]> {
    return this.history$.pipe(map((history) => history.filter((historyModel) => historyModel.unitId === unitId)));
  }

  public getDoors(): Observable<Unit[]> {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitTypeId === UnitType.Doors)));
  }

  public getWindows() {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitTypeId === UnitType.Windows)));
  }

  public getMotionSensor() {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitTypeId === UnitType.MotionSensor)));
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
