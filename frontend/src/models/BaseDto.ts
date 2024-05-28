import {ResponseDto} from "./ResponseDto";
import {HistoryModel} from "./HistoryModel";
import {EmailModel} from "./EmailModel";
import {UserModel} from "./UserModel";
import {Unit} from "./Unit";

export class BaseDto<T> {
  eventType: string;

  constructor(init?: Partial<T> ) {
    this.eventType = this.constructor.name;
    Object.assign(this, init);
  }
}

export class ServerOpensWindowDoorDto extends BaseDto<ServerOpensWindowDoorDto>{
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerClosesWindowDoorDto extends BaseDto<ServerClosesWindowDoorDto>{
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerAlarmTriggeredDto extends BaseDto<ServerAlarmTriggeredDto>{
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerCreatesEmailDto extends BaseDto<ServerCreatesEmailDto>{
  email!: EmailModel;
}

export class ServerDeletesEmailDto extends BaseDto<ServerDeletesEmailDto>{
  success!: boolean;
  emailId!: number;
}

export class ServerCreatesNewUserDto extends BaseDto<ServerCreatesNewUserDto>{
  messageToClient!: string;
  user!: UserModel;
}

export class ServerHasActivatedAlarmDto extends BaseDto<ServerHasActivatedAlarmDto>{
  history!: HistoryModel;
}

export class ServerHasActivatedMotionSensorAlarmDto extends BaseDto<ServerHasActivatedMotionSensorAlarmDto>{
  history!: HistoryModel;
}

export class ServerHasDeactivatedAlarmDto extends BaseDto<ServerHasDeactivatedAlarmDto>{
  history!: HistoryModel;
}

export class ServerHasDeactivatedMotionSensorAlarmDto extends BaseDto<ServerHasDeactivatedMotionSensorAlarmDto>{
  history!: HistoryModel;
}

export class ServerLocksDoorDto extends BaseDto<ServerLocksDoorDto>{
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerUnlocksDoorDto extends BaseDto<ServerUnlocksDoorDto>{
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerSensesMotionDto extends BaseDto<ServerSensesMotionDto> {
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerStopsSensingMotionDto extends BaseDto<ServerStopsSensingMotionDto>{
  history!: HistoryModel;
  unit!: Unit;
}

export class ServerShowsEmailsDto extends BaseDto<ServerShowsEmailsDto>{
  emails!: EmailModel[];
}

export class ServerShowsHistoryDto extends BaseDto<ServerShowsHistoryDto>{
  historyList!: HistoryModel[];
}

export class ServerShowsUnitsDto extends BaseDto<ServerShowsUnitsDto>{
  unitList!: Unit[];
}

export class ServerAuthenticatesUserDto extends BaseDto<ServerAuthenticatesUserDto>{
  user!: UserModel;
  jwt!: string;
}

export class ServerDeAuthenticatesUserDto extends BaseDto<ServerDeAuthenticatesUserDto>{
  messageToClient!: string;
}
