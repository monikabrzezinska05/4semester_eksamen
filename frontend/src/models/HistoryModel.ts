import {Unit} from "./Unit";

export interface HistoryModel {
  historyId?: number;
  unit: Unit;
  personName: String;
  unitId: number;
  date: Date;
  eventType: EventType;
}

export enum EventType{
  Open,
  Close,
  AlarmTriggered,
  AlarmStopped,
  AlarmArmed,
  AlarmDisarmed,
}
