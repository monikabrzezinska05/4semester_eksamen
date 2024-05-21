import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';
import '../models/events/events_model.dart';
import '../models/history/history_model.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final BroadcastWsChannel wsChannel;

  HistoryCubit(this.wsChannel) : super(HistoryState.initial()) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerAlarmTriggered(eventType: _, history: var model):
          _onAddToHistory(model);
        case ServerShowsHistory(eventType: _, historyList: var model):
          _onHistoryReceived(model);
        case ServerClosesWindowDoor(history: var model, unit: _):
          _onAddToHistory(model);
        case ServerOpensWindowDoor(history: var model, unit: _):
          _onAddToHistory(model);
        case ServerHasActivatedAlarm(history: var model):
          _onAddToHistory(model);
        case ServerHasDeactivatedAlarm(history: var model):
          _onAddToHistory(model);
        case ServerHasActivatedMotionSensorAlarm(history: var model):
          _onAddToHistory(model);
        case ServerHasDeactivatedMotionSensorAlarm(history: var model):
          _onAddToHistory(model);
        case ServerAlarmTriggered(history: var model, unit: _):
          _onAddToHistory(model);
      }
    }, onError: (error) {
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }

  Future<void> init() async {
    _send(ClientWantsToSeeHistory(eventType: ClientWantsToSeeHistory.name));
  }

  _send(ClientEvent event) {
    wsChannel.sink.add(jsonEncode(event.toJson()));
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
          .where((historyModel) => historyModel.personName == person)
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
    emit(state.copyWith(
        allHistory: model, shownHistory: model, isLoading: false));
  }

  void _onAddToHistory(HistoryModel model) {
    List<HistoryModel> historyList = List.from(state.allHistory);
    historyList.add(model);
    emit(state.copyWith(allHistory: historyList));
  }
}
