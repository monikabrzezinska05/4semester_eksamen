import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/email_list_bloc/email_list_state.dart';
import 'package:mob_dev/models/email_list/email_list_model.dart';

class EmailListCubit extends Cubit<EmailListState> {
  EmailListCubit() : super(EmailListState(allEmails: [], isLoading: true));

  //Todo - Change once we have valid data.
  Future<void> init() async {
    emit(state.copyWith(allEmails: [], isLoading: false));
  }

  //TODO - Opdater til når vi har funktionalitet til at update emails i emaillist table.
  int _id = 0;

  void addEmail(String email) {
    emit(state.copyWith(allEmails: [
      ...state.allEmails,
      EmailListModel(id: _id++, mail: email)
    ]));
  }

  void removeEmail(int id) {
    emit(state.copyWith(
        allEmails:
            state.allEmails.where((emailModel) => emailModel.id != id).toList()));
  }
}
