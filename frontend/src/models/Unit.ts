export interface Unit{
  unitId?: number;
  name: string;
  status: boolean;
  unitType: UnitType;
}

export enum UnitType{
  Door,
  Window,
  MotionSensor,
}
