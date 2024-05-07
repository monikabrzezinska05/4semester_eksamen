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
  responseDto!: ResponseDto<HistoryModel>;
}

export class ServerClosesWindowDoorDto extends BaseDto<ServerClosesWindowDoorDto>{
  responseDto!: ResponseDto<HistoryModel>;
}

export class ServerAlarmTriggeredDto extends BaseDto<ServerAlarmTriggeredDto>{
  responseDto!: ResponseDto<HistoryModel>;
}

export class ServerLoginDto extends BaseDto<ServerLoginDto>{
  responseDto!: ResponseDto<UserModel>;
}

export class ServerLogoffDto extends BaseDto<ServerLogoffDto>{
  responseDto!: ResponseDto<HistoryModel[]>;
}

export class ServerShowsEmailListDto extends BaseDto<ServerShowsEmailListDto>{
  responseDto!: ResponseDto<EmailModel[]>;
}

export class ServerShowsHistoryDto extends BaseDto<ServerShowsHistoryDto>{
  responseDto!: ResponseDto<HistoryModel[]>;
}

export class ServerOpensConnectionDto extends BaseDto<ServerOpensConnectionDto>{
  ResponseDto!: ResponseDto<Unit[]>;
}
