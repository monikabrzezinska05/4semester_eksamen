export interface Unit{
  UnitId?: number;
  Name: string;
  Status: boolean;
  UnitTypeId: UnitType;
}

export enum UnitType{
  Door,
  Window,
  MotionSensor,
}
