import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/home_bloc/home_state.dart';
import 'package:mob_dev/models/history/history_model.dart';
import 'package:mob_dev/models/unit/unit_model.dart';

import '../main.dart';
import '../models/events/events_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final BroadcastWsChannel wsChannel;

  HomeCubit(this.wsChannel) : super(HomeState(units: {}, isLoading: true)) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerShowsUnits(eventType: _, unitList: var model):
          _onUnitsReceived(model);
        case ServerClosesWindowDoor(history: _, unit: var model):
          _onUnitStatusChanged(model);
        case ServerOpensWindowDoor(history: _, unit: var model):
          _onUnitStatusChanged(model);
        case ServerHasActivatedAlarm(history: _):
          _onArmAlarmOnUnits();
        case ServerHasDeactivatedAlarm(history: _):
          _onDisarmAlarmOnUnits();
        case ServerHasActivatedMotionSensorAlarm(history: _):
          _onArmMotionSensor();
        case ServerHasDeactivatedMotionSensorAlarm(history: _):
          _onDisarmMotionSensor();
        case ServerAlarmTriggered(history: _, unit: var model):
          _onUnitTriggered(model);
        case ServerLocksDoor(history: _, unit: var model):
          _onUnitStatusChanged(model);
        case ServerUnlocksDoor(history: _, unit: var model):
          _onUnitStatusChanged(model);
        case ServerSensesMotion(history: _, unit: var model):
          _onUnitStatusChanged(model);
        case ServerStopsSensingMotion(history: _, unit: var model):
          _onUnitStatusChanged(model);
      }
    }, onError: (error) {
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }

  Future<void> init() async {
    _send(ClientWantsToSeeUnits(eventType: ClientWantsToSeeUnits.name));
  }

  void _send(ClientWantsToSeeUnits clientWantsToSeeUnits) {
    wsChannel.sink.add(jsonEncode(clientWantsToSeeUnits.toJson()));
  }

  void _onUnitsReceived(List<UnitModel> model) {
    Map<UnitType, List<UnitModel>> units = {};
    model.forEach((unit) {
      if (units.containsKey(unit.unitType)) {
        units[unit.unitType]!.add(unit);
      } else {
        units[unit.unitType] = [unit];
      }
    });
    emit(state.copyWith(units: units));
  }

  void _onUnitStatusChanged(UnitModel model) {
    // Create new map and list with the units, to not modify the state directly
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    List<UnitModel> unitList = List.from(units[model.unitType]!);

    // Find the index of the unit to be updated
    int index = unitList.indexWhere((unit) => unit.unitId == model.unitId);

    // Modify Unit if found, and replace the list in the map
    if (index != -1) {
      UnitModel updatedUnit = unitList[index].copyWith(status: model.status);
      unitList[index] = updatedUnit;
      units[model.unitType] = unitList;
      emit(state.copyWith(units: units));

      _statusColors(updatedUnit.status);
    }
  }

  void _onArmAlarmOnUnits() {
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    units.forEach((key, value) {
      List<UnitModel> unitList = List.from(value);
      unitList.forEach((unit) {
        if (unit.unitType == UnitType.Window ||
            unit.unitType == UnitType.Door) {
          unitList[unitList
                  .indexWhere((element) => element.unitId == unit.unitId)] =
              unit.copyWith(status: Status.Armed);
        }
      });
      units[key] = unitList;
    });
    emit(state.copyWith(units: units));
  }

  void _onDisarmAlarmOnUnits() {
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    units.forEach((key, value) {
      List<UnitModel> unitList = List.from(value);
      unitList.forEach((unit) {
        if (unit.unitType == UnitType.Window ||
            unit.unitType == UnitType.Door) {
          unitList[unitList
                  .indexWhere((element) => element.unitId == unit.unitId)] =
              unit.copyWith(status: Status.Disarmed);
        }
      });
      units[key] = unitList;
    });
    emit(state.copyWith(units: units));
  }

  void _onArmMotionSensor() {
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    units.forEach((key, value) {
      List<UnitModel> unitList = List.from(value);
      unitList.forEach((unit) {
        if (unit.unitType == UnitType.MotionSensor) {
          unitList[unitList
              .indexWhere((element) => element.unitId == unit.unitId)] =
              unit.copyWith(status: Status.Armed);
        }
      });
      units[key] = unitList;
    });
    emit(state.copyWith(units: units));
  }

  void _onDisarmMotionSensor() {
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    units.forEach((key, value) {
      List<UnitModel> unitList = List.from(value);
      unitList.forEach((unit) {
        if (unit.unitType == UnitType.MotionSensor) {
          unitList[unitList
              .indexWhere((element) => element.unitId == unit.unitId)] =
              unit.copyWith(status: Status.Disarmed);
        }
      });
      units[key] = unitList;
    });
    emit(state.copyWith(units: units));
  }

  void _onUnitTriggered(UnitModel model) {
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    List<UnitModel> unitList = List.from(units[model.unitType]!);

    int index = unitList.indexWhere((unit) => unit.unitId == model.unitId);

    if (index != -1) {
      UnitModel updatedUnit =
          unitList[index].copyWith(status: Status.Triggered);
      unitList[index] = updatedUnit;
      units[model.unitType] = unitList;
      emit(state.copyWith(units: units));
    }
  }

  void _statusColors(Status status) {
    Color color;
    if(status == Status.Armed || status == Status.Closed) {
      color = Colors.green;
    } else if (status == Status.Disarmed || status == Status.Open) {
      color = Colors.yellow;
    } else if (status == Status.Triggered){
      color = Colors.red;
    } else {
      color = Colors.black;
    }
    emit(state.copyWith(indicatorColor: color));
  }

  void getUnitsByType(UnitType type) {
    List<UnitModel> units = state.allUnits.where((unit) => unit.unitType == type).toList();
    emit(state.copyWith(allUnits: units));
  }
}