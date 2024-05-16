import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/home_bloc/home_state.dart';
import 'package:mob_dev/models/unit/unit_model.dart';

import '../main.dart';
import '../models/events/events_model.dart';

class HomeCubit extends Cubit<HomeState>{
  final BroadcastWsChannel wsChannel;

  HomeCubit(this.wsChannel): super(HomeState(units: units, isLoading: false)){
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerShowsUnits(eventType: _, units: var model):
            _onUnitsReceived(model);
      }
    }, onError: (error){
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }
//TODO -> Lav en form for map til de tre typer at units...
  void _onUnitsReceived(List<UnitModel> model) {
    emit(state.copyWith(units: model));
  }

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