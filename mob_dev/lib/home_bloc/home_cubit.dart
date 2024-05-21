import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/home_bloc/home_state.dart';
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
          _onUnitClosed(model);
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



  void _onUnitClosed(UnitModel model) {
    // Create new map and list with the units, to not modify the state directly
    Map<UnitType, List<UnitModel>> units = Map.from(state.units);
    List<UnitModel> unitList = List.from(units[model.unitType]!);

    // Find the index of the unit to be updated
    int index = unitList.indexWhere((unit) => unit.unitId == model.unitId);

    // Modify Unit if found, and replace the list in the map
    if (index != -1) {
      UnitModel updatedUnit = unitList[index].copyWith(status: Status.Closed);
      unitList[index] = updatedUnit;
      units[model.unitType] = unitList;
      emit(state.copyWith(units: units));
    }
  }
}