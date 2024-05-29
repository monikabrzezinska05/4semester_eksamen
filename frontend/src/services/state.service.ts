import {Injectable} from "@angular/core";
import {Status, Unit, UnitType} from "../models/Unit";
import {environment} from "../environments/environment";
import {
  BaseDto,
  ServerAuthenticatesUserDto,
  ServerClosesWindowDoorDto,
  ServerCreatesEmailDto,
  ServerCreatesNewUserDto,
  ServerDeAuthenticatesUserDto,
  ServerDeletesEmailDto,
  ServerHasActivatedAlarmDto,
  ServerHasActivatedMotionSensorAlarmDto,
  ServerHasDeactivatedAlarmDto,
  ServerHasDeactivatedMotionSensorAlarmDto,
  ServerLocksDoorDto,
  ServerSensesMotionDto,
  ServerShowsEmailsDto,
  ServerShowsHistoryDto,
  ServerShowsUnitsDto,
  ServerStopsSensingMotionDto,
  ServerUnlocksDoorDto
} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";
import {UserModel} from "../models/UserModel";
import {Router} from "@angular/router";
import {BehaviorSubject, map, Observable} from "rxjs";
import {EmailModel} from "../models/EmailModel";
import {ToastrService} from "ngx-toastr";

@Injectable({
  providedIn: 'root'
})

export class State {
  private authenticated: boolean = false;
  currentUser?: UserModel;
  jwt?: string | null = localStorage.getItem('jwt');
  currentUserId?: string | null = localStorage.getItem('currentUserId');
  ws: WebSocket = new WebSocket(environment.websocketBaseUrl);
  messageToClient?: string | null = localStorage.getItem('messageToClient');
  alarmOn: Observable<boolean> = new Observable<boolean>();
  motionAlarmOn: Observable<boolean> = new Observable<boolean>();

  history$: BehaviorSubject<HistoryModel[]> = new BehaviorSubject<HistoryModel[]>([]);
  units$: BehaviorSubject<Unit[]> = new BehaviorSubject<Unit[]>([]);
  emails$: BehaviorSubject<EmailModel[]> = new BehaviorSubject<EmailModel[]>([]);

  constructor(private router: Router, private toastr: ToastrService) {
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received", messageFromServer);
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
    this.alarmOn = this.getAlarmStatus();
    this.motionAlarmOn = this.getMotionAlarmStatus();
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    let current = this.history$.getValue();
    this.history$.next([...current, ...dto.historyList]);
  }

  ServerShowsEmails(dto: ServerShowsEmailsDto) {
    let current = this.emails$.getValue();
    this.emails$.next([...current, ...dto.emails]);
  }

  ServerAuthenticatesUser(dto: ServerAuthenticatesUserDto) {
    if (dto.user !== null && dto.jwt !== null) {
      this.authenticated = true;
      this.currentUser = dto.user;
      this.jwt = dto.jwt;
      localStorage.setItem('jwt', this.jwt);
      localStorage.setItem('currentUserId', this.currentUser.mail);
      this.router.navigateByUrl('');

      this.getUnitsFromServer();
      this.getHistoryFromServer();
      this.getEmailsFromServer();
    }
    else {
      this.router.navigateByUrl('/login');
      this.toastr.error("Login failed, please try again.");
    }
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

  private getEmailsFromServer() {
    let dto = {
      eventType: "ClientWantsToSeeEmails"
    }
    this.ws.send(JSON.stringify(dto));
  }

  ServerDeAuthenticatesUser(dto: ServerDeAuthenticatesUserDto) {
    this.authenticated = false;
    this.currentUser = undefined;
    this.units$ = new BehaviorSubject<Unit[]>([]);
    this.history$ = new BehaviorSubject<HistoryModel[]>([]);
    this.emails$ = new BehaviorSubject<EmailModel[]>([]);

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
    this.addToManyHistory(dto.history);
    this.setDoorWindowUnitsStatus(Status.Disarmed);
  }

  ServerHasDeactivatedMotionSensorAlarm(dto: ServerHasDeactivatedMotionSensorAlarmDto){
    this.addToHistory(dto.history);
    this.setMotionSensorStatus(Status.Disarmed);
  }

  ServerLocksDoor(dto: ServerLocksDoorDto) {
    this.updateUnit(dto.unit);
    this.addToHistory(dto.history);
  }

  ServerUnlocksDoor(dto: ServerUnlocksDoorDto) {
    this.updateUnit(dto.unit);
    this.addToHistory(dto.history);
  }

  ServerSensesMotion(dto: ServerSensesMotionDto) {
    this.updateUnit(dto.unit);
    this.addToHistory(dto.history);
  }

  ServerStopsSensingMotionDto(dto: ServerStopsSensingMotionDto) {
    this.updateUnit(dto.unit);
    this.addToHistory(dto.history);
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
    this.messageToClient = dto.messageToClient;
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
  private addToManyHistory(history: HistoryModel[]) {
    let current = this.history$.getValue();
    this.history$.next([...current, ...history]);
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

  getAllEmails() : Observable<EmailModel[]> {
    return this.emails$.asObservable();
  }

  private getAlarmStatus() {
    return this.units$.pipe(map((units) => {
      let Disarmed = units.filter((unit) => unit.status === Status.Disarmed && unit.unitType !== UnitType.MotionSensor);

      console.log("Disarmed: ", Disarmed)
      if (Disarmed.length > 0) {
        return false;
      } else {
        return true;
      }
    }));
  }

  private getMotionAlarmStatus() {
    return this.units$.pipe(map((units) => {
      let Disarmed = units.filter((unit) => unit.status === Status.Disarmed && unit.unitType === UnitType.MotionSensor);

    if (Disarmed.length > 0) {
      return false;
    } else {
      return true;
    }
    }));
  }

}
