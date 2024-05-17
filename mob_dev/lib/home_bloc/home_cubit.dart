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
      }
    }, onError: (error) {
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }

  Future<void> init() async {
    _send(ClientWantsToSeeUnits(eventType: ClientWantsToSeeUnits.name));
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

  void _send(ClientWantsToSeeUnits clientWantsToSeeUnits) {
    wsChannel.sink.add(jsonEncode(clientWantsToSeeUnits.toJson()));
  }
}