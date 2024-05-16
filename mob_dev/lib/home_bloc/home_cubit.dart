import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/home_bloc/home_state.dart';
import 'package:mob_dev/models/unit/unit_model.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(): super(HomeState(units: units, isLoading: false));

}

final Map<String, List<UnitModel>> units = {
  'MasterUnit 1': [
    UnitModel(name: 'unit 1', unitId: 1, unitType: UnitType.Door, status: Status.armed),
    UnitModel(name: 'unit 2', unitId: 2, unitType: UnitType.Door, status: Status.armed),
    UnitModel(name: 'unit 3', unitId: 3, unitType: UnitType.Door, status: Status.armed),
  ],
  'MasterUnit 2': [
    UnitModel(name: 'unit 4', unitId: 4, unitType: UnitType.Window, status: Status.armed),
    UnitModel(name: 'unit 5', unitId: 5, unitType: UnitType.Window, status: Status.armed),
    UnitModel(name: 'unit 6', unitId: 6, unitType: UnitType.Window, status: Status.armed),
  ],
  'MasterUnit 3': [
    UnitModel(name: 'unit 7', unitId: 7, unitType: UnitType.MotionSensor, status: Status.armed),
    UnitModel(name: 'unit 8', unitId: 8, unitType: UnitType.MotionSensor, status: Status.armed),
    UnitModel(name: 'unit 9', unitId: 9, unitType: UnitType.MotionSensor, status: Status.armed),
  ],
};