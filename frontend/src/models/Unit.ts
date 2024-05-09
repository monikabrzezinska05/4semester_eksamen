export interface Unit{
  unitId?: number;
  name: string;
  status: boolean;
  unitTypeId: UnitType;
}

export enum UnitType{
  Door,
  Window,
  MotionSensor,
}
