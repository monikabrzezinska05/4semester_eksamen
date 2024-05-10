export interface Unit{
  unitId?: number;
  name: string;
  status: Status;
  unitTypeId: UnitType;
}

export enum UnitType{
  Door,
  Window,
  MotionSensor,
}

export enum Status{
  Armed,
  Disarmed,
  Triggered,
}
