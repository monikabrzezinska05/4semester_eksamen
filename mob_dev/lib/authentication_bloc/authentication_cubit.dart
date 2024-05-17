import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/authentication_bloc/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final BroadcastWsChannel wsChannel;

  AuthenticationCubit(this.wsChannel) : super(AuthenticationState.initial()) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case Server(eventType: _, historyModel: var model):
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
}