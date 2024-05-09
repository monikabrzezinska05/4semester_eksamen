import {Injectable} from "@angular/core";
import {Unit, UnitType} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerOpensConnectionDto, ServerShowsHistoryDto} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";
import {BehaviorSubject, combineLatest, map, Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})

export class State {
  history$: BehaviorSubject<HistoryModel[]> = new BehaviorSubject<HistoryModel[]>([]);
  units$: BehaviorSubject<Unit[]> = new BehaviorSubject<Unit[]>([]);
  ws: WebSocket = new WebSocket(environment.baseUrl);

  constructor() {
    console.log("something happened before connect");
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received", messageFromServer);
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }

    this.ws.onopen = () => {
      this.ws.send(JSON.stringify({
        eventType: "ClientOpensConnection"
      }));
    };
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    var current = this.history$.getValue();
    this.history$.next([...current, ...dto.responseDto.responseData]);
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
