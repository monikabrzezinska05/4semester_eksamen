import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/email_list_bloc/email_list_state.dart';
import 'package:mob_dev/models/email_list/email_model.dart';

import '../main.dart';
import '../models/events/events_model.dart';

class EmailListCubit extends Cubit<EmailListState> {
  final BroadcastWsChannel wsChannel;
  EmailListCubit(this.wsChannel) : super(EmailListState(allEmails: [], isLoading: true)) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerShowsEmailList(eventType: _, emails: var model):
          _onEmailListReceived(model);
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

  //TODO - Opdater til når vi har funktionalitet til at update emails i emaillist table.
  int _id = 0;

  void addEmail(String email) {
    emit(state.copyWith(allEmails: [
      ...state.allEmails,
      EmailModel(id: _id++, mail: email)
    ]));
  }

  void removeEmail(int id) {
    emit(state.copyWith(
        allEmails:
            state.allEmails.where((emailModel) => emailModel.id != id).toList()));
  }

  void _onEmailListReceived(List<EmailModel> model) {
    emit(state.copyWith(allEmails: model, isLoading: false));
  }
}
