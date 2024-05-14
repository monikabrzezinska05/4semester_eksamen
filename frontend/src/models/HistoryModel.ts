export interface HistoryModel {
  historyId?: number;
  UserEmail: String;
  unitId: number;
  date: Date;
  eventTypeId: EventType;
}

export enum EventType{
  Open,
  Close,
  AlarmTriggered,
  AlarmStopped,
  AlarmArmed,
  AlarmDisarmed,
}
