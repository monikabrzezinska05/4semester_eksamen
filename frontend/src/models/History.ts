export interface History{
  historyId?: number;
  userId: number;
  unitId: number;
  date: Date;
  EventType: EventType;
}

export enum EventType{
  Open,
  Close,
  AlarmTriggered,
  AlarmStopped,
  AlarmArmed,
  AlarmDisarmed,
}
