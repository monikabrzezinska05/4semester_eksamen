import {Injectable} from "@angular/core";
import {Unit, UnitType} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerAuthenticatesUserDto, ServerOpensConnectionDto, ServerShowsHistoryDto} from "../models/BaseDto";
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
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    this.history.push(...dto.responseDto.responseData);
  }

  ServerAuthenticatesUser(dto: ServerAuthenticatesUserDto) {
    if (dto.responseDto !== null && dto.jwt !== null) {
      this.authenticated = true;
      this.currentUser = dto.responseDto;
      console.log("authentication happens in frontend");
      this.router.navigateByUrl('');
    }
  }

  ServerOpensConnection(dto: ServerOpensConnectionDto) {
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
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitTypeId === UnitType.Door)));
  }

  public getWindows() {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitTypeId === UnitType.Window)));
  }

  public getMotionSensor() {
    return this.units$.pipe(map((units) => units.filter((unit) => unit.unitTypeId === UnitType.MotionSensor)));
  }
}
