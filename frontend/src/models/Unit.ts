export interface Unit{
  unitId?: number;
  name: string;
  status: Status;
  unitType: UnitType;
}

export enum UnitType{
  Doors,
  Windows,
  MotionSensor,
}

export enum Status{
  Armed,
  Disarmed,
  Triggered,
  Open,
  Closed,
}
