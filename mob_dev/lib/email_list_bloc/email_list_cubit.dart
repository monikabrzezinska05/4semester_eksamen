import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/email_list_bloc/email_list_state.dart';
import 'package:mob_dev/models/email_list/email_model.dart';

import '../main.dart';
import '../models/events/events_model.dart';
import '../models/history/history_model.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BroadcastWsChannel wsChannel;
  SettingsCubit(this.wsChannel) : super(SettingsState(allEmails: [], isLoading: true)) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerShowsEmails(eventType: _, emails: var model):
          _onEmailListReceived(model);
        case ServerCreatesEmail(eventType: _, email: var model):
          _onEmailCreated(model);
        case ServerDeletesEmail(eventType: _, success: var model, emailId: var id):
          _onEmailDeleted(model, id);
      }
    },  onError: (error)
    {
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }

  Future<void> init() async {
    _send(ClientWantsToSeeEmails(eventType: ClientWantsToSeeEmails.name));
  }

  _send(ClientEvent event) {
    wsChannel.sink.add(jsonEncode( event.toJson()));
  }


  void addEmail(String email) {
    _send(ClientWantsToCreateEmail(eventType: ClientWantsToCreateEmail.name, email: email));
  }

  void removeEmail(int id) {
    _send(ClientWantsToDeleteEmail(eventType: ClientWantsToDeleteEmail.name, emailId: id));
  }

  void turnOffAlarm(HistoryModel historyModel) {
    _send(ClientWantsToTurnOffAlarm(eventType: ClientWantsToTurnOffAlarm.name, historyModel: historyModel));
  }

  void _onEmailListReceived(List<EmailModel> model) {
    emit(state.copyWith(allEmails: model, isLoading: false));
  }

  void _onEmailCreated(EmailModel model) {
    emit(state.copyWith(allEmails: [...state.allEmails, model]));
  }

  void _onEmailDeleted(bool model, int id) {
    if (model) {
      emit(state.copyWith(
          allEmails:
          state.allEmails.where((emailModel) => emailModel.id != id).toList()));
    }
  }
}
