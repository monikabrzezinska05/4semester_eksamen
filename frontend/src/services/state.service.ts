import {Injectable} from "@angular/core";
import {Status, Unit, UnitType} from "../models/Unit";
import {environment} from "../environments/environment";
import {
  BaseDto,
  ServerAuthenticatesUserDto,
  ServerShowsUnitsDto,
  ServerShowsHistoryDto,
  ServerDeAuthenticatesUserDto,
  ServerClosesWindowDoorDto,
  ServerHasActivatedAlarmDto,
  ServerHasActivatedMotionSensorAlarmDto,
  ServerHasDeactivatedAlarmDto,
  ServerHasDeactivatedMotionSensorAlarmDto,
  ServerCreatesEmailDto, ServerDeletesEmailDto, ServerCreatesNewUserDto
} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";
import {UserModel} from "../models/UserModel";
import {Router} from "@angular/router";
import {BehaviorSubject, map, Observable} from "rxjs";
import {EmailModel} from "../models/EmailModel";

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
  emails$: BehaviorSubject<EmailModel[]> = new BehaviorSubject<EmailModel[]>([]);

  constructor(private router: Router) {
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received", messageFromServer);
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    let current = this.history$.getValue();
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
    let dto = {
      eventType: "ClientWantsToSeeUnits"
    }
    this.ws.send(JSON.stringify(dto));
  }

  private getHistoryFromServer() {
    let dto = {
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
    let current = this.units$.getValue();
    this.units$.next([...current, ...dto.unitList]);
  }

  ServerClosesWindowDoor(dto: ServerClosesWindowDoorDto) {
    this.updateUnit(dto.unit);
    this.addToHistory(dto.history);
  }

  ServerHasActivatedAlarm(dto: ServerHasActivatedAlarmDto) {
    this.addToHistory(dto.history);
    this.setDoorWindowUnitsStatus(Status.Armed);
  }

  ServerHasActivatedMotionSensorAlarm(dto: ServerHasActivatedMotionSensorAlarmDto){
    this.addToHistory(dto.history);
    this.setMotionSensorStatus(Status.Armed);
  }

  ServerHasDeactivatedAlarm(dto: ServerHasDeactivatedAlarmDto) {
    this.addToHistory(dto.history);
    this.setDoorWindowUnitsStatus(Status.Disarmed);
  }

  ServerHasDeactivatedMotionSensorAlarm(dto: ServerHasDeactivatedMotionSensorAlarmDto){
    this.addToHistory(dto.history);
    this.setMotionSensorStatus(Status.Disarmed);
  }

  ServerOpensWindowDoor(dto: ServerClosesWindowDoorDto) {
    this.updateUnit(dto.unit);
    this.addToHistory(dto.history);
  }

  ServerCreatesEmail(dto: ServerCreatesEmailDto) {
    let current = this.emails$.getValue();
    current.push(dto.email);
    this.emails$.next(current);
  }

  ServerDeletesEmail(dto: ServerDeletesEmailDto) {
    let current = this.emails$.getValue();
    let index = current.findIndex(email => email.id === dto.emailId);
    current.splice(index, 1);
    this.emails$.next(current);
  }

  ServerCreatesNewUser(dto: ServerCreatesNewUserDto) {
    //TODO - implement this function.
  }

  private updateUnit(unit: Unit) {
    let current = this.units$.getValue();
    let index = current.findIndex(unit => unit.unitId === unit.unitId);
    current[index] = unit;
    this.units$.next(current);
  }

  private addToHistory(history: HistoryModel) {
    let current = this.history$.getValue();
    current.push(history);
    this.history$.next(current);
  }

  private setDoorWindowUnitsStatus(status: Status) {
    let current = this.units$.getValue();
    current.forEach(unit => {
      if (unit.unitType === UnitType.Doors || unit.unitType === UnitType.Windows) {
        unit.status = status;
      }
    });
    this.units$.next(current);
  }

  private setMotionSensorStatus(status: Status) {
    let current = this.units$.getValue();
    current.forEach(unit => {
      if (unit.unitType === UnitType.MotionSensor) {
        unit.status = status;
      }
    });
    this.units$.next(current);
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
    let dto = {
      eventType: "ClientAuthenticateWithJwt",
      jwt: this.jwt,
      user: this.currentUserId
    }
    this.ws.send(JSON.stringify(dto));
  }
}
