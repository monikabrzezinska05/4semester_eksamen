import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../history/history_model.dart';

part 'events_model.freezed.dart';
part 'events_model.g.dart';

sealed class BaseEvent {}

abstract class ClientEvent extends BaseEvent {
  Map<String, dynamic> toJson();
}

@freezed
class ClientClosesWindowDoor extends ClientEvent with _$ClientClosesWindowDoor {
  static const String name = "ClientClosesWindowDoor";

  const factory ClientClosesWindowDoor({
    required String eventType,
    required HistoryModel historyModel,
  }) = _ClientClosesWindowDoor;

  factory ClientClosesWindowDoor.fromJson(Map<String, Object?> json) =>
      _$ClientClosesWindowDoorFromJson(json);
}

@freezed
class ClientOpensWindowDoor extends ClientEvent with _$ClientOpensWindowDoor {
  static const String name = "ClientOpensWindowDoor";

  const factory ClientOpensWindowDoor({
    required String eventType,
    required HistoryModel historyModel,
  }) = _ClientOpensWindowDoor;

  factory ClientOpensWindowDoor.fromJson(Map<String, Object?> json) =>
      _$ClientOpensWindowDoorFromJson(json);
}
// Ved ikke om vi skal have dette på mobil siden.
//
// @freezed
// class ClientWantsToCreateUser extends ClientEvent
//     with _$ClientWantsToCreateUser {
//   static const String name = "ClientWantsToCreateUser";
//
//   const factory ClientWantsToCreateUser({
//     required String eventType,
//     required String name,
//     required String password,
//     required bool isChild,
//     required String email,
//   }) = _ClientWantsToCreateUser;
//
//   factory ClientWantsToCreateUser.fromJson(Map<String, Object?> json) =>
//       _$ClientWantsToCreateUser(json);
// }

@freezed
class ClientWantsToLogin extends ClientEvent with _$ClientWantsToLogin {
  static const String name = "ClientWantsToLogin";

  const factory ClientWantsToLogin({
    required String eventType,
    required String email,
    required String password,
  }) = _ClientWantsToLogin;

  factory ClientWantsToLogin.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToLoginFromJson(json);
}

  // class ClientWantsToLogoff extends ClientEvent with _$ClientWantsToLogoff {
  //
  // }

@freezed
class ClientWantsToSeeHistory extends ClientEvent
    with _$ClientWantsToSeeHistory {
  static const String name = "ClientWantsToSeeHistory";

  const factory ClientWantsToSeeHistory({
    required String eventType,
    required DateTime timePeriod,
  }) = _ClientWantsToSeeHistory;

  factory ClientWantsToSeeHistory.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToSeeHistoryFromJson(json);
}

// class ClientWantsToTurnOffAlarm extends ClientEvent
//     with _$ClientWantsToTurnOffAlarm {
//
// }

// class ClientWantsToTurnOnAlarm extends ClientEvent
//     with _$ClientWantsToTurnOnAlarm {
//
// }

class ServerEvent extends BaseEvent {
  static ServerEvent fromJson(Map<String, Object?> json) {
    final type = json['eventType'];
    return switch (type) { _ => throw "Unknown event type: $type in $json" };
  }

  // class ServerAlarmTriggered extends ServerEvent with _$ServerAlarmTriggered {
  //
  // }

  // class ServerClosesWindowDoor extends ServerEvent with _$ServerClosesWindowDoor {
  //
  // }

  // class ServerOpensWindowDoor extends ServerEvent with _$ServerOpensWindowDoor {
  //
  // }

  // class ServerCreatesNewUser extends ServerEvent with _$ServerCreatesNewUser {
  //
  // }

  // class ServerHasActivatedAlarm extends ServerEvent with _$ServerHasActivatedAlarm {
  //
  // }

  // class ServerHasDeactivatedAlarm extends ServerEvent with _$ServerClosesWindowDoor {
  //
  // }

  // class ServerLogIn extends ServerEvent with _$ServerLogIn {
  //
  // }

  // class ServerLogoff extends ServerEvent with _$ServerLogoff {
  //
  // }

  // class ServerShowsEmailList extends ServerEvent with _$ServerShowsEmailList {
  //
  // }

  // class ServerShowsHistory extends ServerEvent with _$ServerShowsHistory {
  //
  // }
}
