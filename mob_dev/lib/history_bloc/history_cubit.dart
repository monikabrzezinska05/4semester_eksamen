import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';
import '../models/events/events_model.dart';
import '../models/history/history_model.dart';
import '../models/unit/unit_model.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final BroadcastWsChannel wsChannel;

  HistoryCubit(this.wsChannel) : super(HistoryState.initial()) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerAlarmTriggered(eventType: _, historyModel: var model):
            print(model);
        case ServerShowsHistory(eventType: _, historyList: var model):
            _onHistoryReceived(model);
      }
    },  onError: (error)
    {
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }

   Future<void> init() async {
    _send(ClientWantsToSeeHistory(eventType: ClientWantsToSeeHistory.name));
  }

  _send(ClientEvent event) {
    wsChannel.sink.add(jsonEncode( event.toJson()));
  }

  void onUnitSelected(String unit) {
    if (unit == '') {
      emit(state.copyWith(selectedUnit: '', shownHistory: state.allHistory));
      return;
    }
    emit(
      state.copyWith(
        selectedUnit: unit,
        shownHistory: state.allHistory
            .where(
              (historyModel) => historyModel.unit.name == unit,
            )
            .toList(),
      ),
    );
  }

  void onEventTypeSelected(String eventType) {
    if (eventType == '') {
      emit(state.copyWith(
        selectedEventType: '',
        shownHistory: state.allHistory,
      ));
      return;
    }
    emit(state.copyWith(
      selectedEventType: eventType,
      shownHistory: state.allHistory
          .where((historyModel) => historyModel.eventType.name == eventType)
          .toList(),
    ));
  }

  void onPersonSelected(String person) {
    if (person == '') {
      emit(state.copyWith(
        selectedPerson: '',
        shownHistory: state.allHistory,
      ));
      return;
    }
    emit(state.copyWith(
      selectedPerson: person,
      shownHistory: state.allHistory
          .where((historyModel) =>  historyModel.personName == person)
          .toList(),
    ));
  }

  void resetFilters() {
    emit(state.copyWith(
      selectedUnit: '',
      selectedEventType: '',
      selectedPerson: '',
      shownHistory: state.allHistory,
    ));
  }

  void _onHistoryReceived(List<HistoryModel> model) {
    emit(state.copyWith(allHistory: model, shownHistory: model, isLoading: false));
  }
}

class ClientShowsHistory {
}



/*final List<HistoryModel> historyElements = [
  HistoryModel(
    historyId: 1,
    unit: UnitModel(
      unitId: 1,
      name: 'MasterUnit 1',
      unitType: UnitType.Door,
      status: true,
    ),
    eventType: EventType.AlarmArmed,
    personName: 'Dan Doe',
    date: DateTime.now(),
  ),
  HistoryModel(
    historyId: 2,
    unit: UnitModel(
      unitId: 1,
      name: 'MasterUnit 2',
      unitType: UnitType.Door,
      status: true,
    ),
    eventType: EventType.AlarmDisarmed,
    personName: 'John Doe',
    date: DateTime.now(),
  ),
  HistoryModel(
    historyId: 3,
    unit: UnitModel(
      unitId: 1,
      name: 'MasterUnit 3',
      unitType: UnitType.Door,
      status: true,
    ),
    eventType: EventType.AlarmStopped,
    personName: 'John Doe',
    date: DateTime.now(),
  ),
  HistoryModel(
    historyId: 4,
    unit: UnitModel(
      unitId: 1,
      name: 'MasterUnit 4',
      unitType: UnitType.Door,
      status: true,
    ),
    eventType: EventType.AlarmStopped,
    personName: 'John Doe',
    date: DateTime.now(),
  ),
];*/
