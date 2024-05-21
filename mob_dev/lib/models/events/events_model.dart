import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mob_dev/models/email_list/email_model.dart';
import 'package:mob_dev/models/unit/unit_model.dart';
import 'package:mob_dev/models/user/user_model.dart';
import 'package:mob_dev/models/user_login/user_login_model.dart';

import '../history/history_model.dart';

part 'events_model.freezed.dart';

part 'events_model.g.dart';

sealed class BaseEvent {}

abstract class ClientEvent extends BaseEvent {
  Map<String, dynamic> toJson();
}

@freezed
class ClientWantsToLogin extends ClientEvent with _$ClientWantsToLogin {
  static const String name = "ClientWantsToLogin";

  const factory ClientWantsToLogin({
    required String eventType,
    required UserLoginModel userLogin,
  }) = _ClientWantsToLogin;

  factory ClientWantsToLogin.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToLoginFromJson(json);
}

@freezed
class ClientWantsToSeeUnits extends ClientEvent with _$ClientWantsToSeeUnits {
  static const String name = "ClientWantsToSeeUnits";

  const factory ClientWantsToSeeUnits({
    required String eventType,
  }) = _ClientWantsToSeeUnits;

  factory ClientWantsToSeeUnits.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToSeeUnitsFromJson(json);
}

@freezed
class ClientWantsToSeeHistory extends ClientEvent
    with _$ClientWantsToSeeHistory {
  static const String name = "ClientWantsToSeeHistory";

  const factory ClientWantsToSeeHistory({
    required String eventType,
  }) = _ClientWantsToSeeHistory;

  factory ClientWantsToSeeHistory.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToSeeHistoryFromJson(json);
}

@freezed
class ClientWantsToSeeEmails extends ClientEvent with _$ClientWantsToSeeEmails {
  static const String name = "ClientWantsToSeeEmails";

  const factory ClientWantsToSeeEmails({
    required String eventType,
  }) = _ClientWantsToSeeEmails;

  factory ClientWantsToSeeEmails.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToSeeEmailsFromJson(json);
}

@freezed
class ClientWantsToCreateEmail extends ClientEvent
    with _$ClientWantsToCreateEmail {
  static const String name = "ClientWantsToCreateEmail";

  const factory ClientWantsToCreateEmail({
    required String eventType,
    required String email,
  }) = _ClientWantsToCreateEmail;

  factory ClientWantsToCreateEmail.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToCreateEmailFromJson(json);
}

@freezed
class ClientWantsToDeleteEmail extends ClientEvent
    with _$ClientWantsToDeleteEmail {
  static const String name = "ClientWantsToDeleteEmail";

  const factory ClientWantsToDeleteEmail({
    required String eventType,
    required int emailId,
  }) = _ClientWantsToDeleteEmail;

  factory ClientWantsToDeleteEmail.fromJson(Map<String, Object?> json) =>
      _$ClientWantsToDeleteEmailFromJson(json);
}

class ServerEvent extends BaseEvent {
  static ServerEvent fromJson(Map<String, Object?> json) {
    final type = json['eventType'];
    return switch (type) {
      ServerShowsHistory.name => ServerShowsHistory.fromJson(json),
      ServerShowsUnits.name => ServerShowsUnits.fromJson(json),
      ServerShowsEmails.name => ServerShowsEmails.fromJson(json),
      ServerAuthenticatesUser.name => ServerAuthenticatesUser.fromJson(json),
      ServerShowsEmails.name => ServerShowsEmails.fromJson(json),
      ServerCreatesEmail.name => ServerCreatesEmail.fromJson(json),
      ServerDeletesEmail.name => ServerDeletesEmail.fromJson(json),
      ServerClosesWindowDoor.name => ServerClosesWindowDoor.fromJson(json),
      ServerOpensWindowDoor.name => ServerOpensWindowDoor.fromJson(json),
      _ => throw "Unknown event type: $type in $json"
    };
  }
}

class ServerAlarmTriggered extends ServerEvent {
  static const String name = "ServerAlarmTriggered";

  ServerAlarmTriggered({
    required this.eventType,
    required this.historyModel,
  });

  final String eventType;
  final HistoryModel historyModel;
}

@freezed
class ServerShowsEmails extends ServerEvent with _$ServerShowsEmails {
  static const String name = "ServerShowsEmails";

  const factory ServerShowsEmails({
    required String eventType,
    required List<EmailModel> emails,
  }) = _ServerShowsEmails;

  factory ServerShowsEmails.fromJson(Map<String, Object?> json) =>
      _$ServerShowsEmailsFromJson(json);
}

@freezed
class ServerCreatesEmail extends ServerEvent with _$ServerCreatesEmail {
  static const String name = "ServerCreatesEmail";

  const factory ServerCreatesEmail({
    required String eventType,
    required EmailModel email,
  }) = _ServerCreatesEmail;

  factory ServerCreatesEmail.fromJson(Map<String, Object?> json) =>
      _$ServerCreatesEmailFromJson(json);
}

@freezed
class ServerDeletesEmail extends ServerEvent with _$ServerDeletesEmail {
  static const String name = "ServerDeletesEmail";

  const factory ServerDeletesEmail({
    required String eventType,
    required bool success,
    required int emailId,
  }) = _ServerDeletesEmail;

  factory ServerDeletesEmail.fromJson(Map<String, Object?> json) =>
      _$ServerDeletesEmailFromJson(json);
}

@freezed
class ServerShowsHistory extends ServerEvent with _$ServerShowsHistory {
  static const String name = "ServerShowsHistory";

  const factory ServerShowsHistory({
    required String eventType,
    required List<HistoryModel> historyList,
  }) = _ServerShowsHistory;

  factory ServerShowsHistory.fromJson(Map<String, Object?> json) =>
      _$ServerShowsHistoryFromJson(json);
}

@freezed
class ServerShowsUnits extends ServerEvent with _$ServerShowsUnits {
  static const String name = "ServerShowsUnits";

  const factory ServerShowsUnits({
    required String eventType,
    required List<UnitModel> unitList,
  }) = _ServerShowsUnits;

  factory ServerShowsUnits.fromJson(Map<String, Object?> json) =>
      _$ServerShowsUnitsFromJson(json);
}

@freezed
class ServerAuthenticatesUser extends ServerEvent
    with _$ServerAuthenticatesUser {
  static const String name = "ServerAuthenticatesUser";

  const factory ServerAuthenticatesUser({
    required String eventType,
    required UserModel user,
    required String jwt,
  }) = _ServerAuthenticatesUser;

  factory ServerAuthenticatesUser.fromJson(Map<String, Object?> json) =>
      _$ServerAuthenticatesUserFromJson(json);
}

@freezed
class ServerDeAuthenticatesUser with _$ServerDeAuthenticatesUser {
  static const String name = "ServerDeAuthenticatesUser";

  const factory ServerDeAuthenticatesUser({
    required String eventType,
  }) = _ServerDeAuthenticatesUser;

  factory ServerDeAuthenticatesUser.fromJson(Map<String, Object?> json) =>
      _$ServerDeAuthenticatesUserFromJson(json);
}

@freezed
class ServerClosesWindowDoor  extends ServerEvent with _$ServerClosesWindowDoor {
  static const String name = "ServerClosesWindowDoor";

  const factory ServerClosesWindowDoor({
    required HistoryModel history,
    required UnitModel unit,
  }) = _ServerClosesWindowDoor;

  factory ServerClosesWindowDoor.fromJson(Map<String, Object?> json) =>
      _$ServerClosesWindowDoorFromJson(json);
}

@freezed
class ServerOpensWindowDoor extends ServerEvent with _$ServerOpensWindowDoor {
  static const String name = "ServerOpensWindowDoor";

  const factory ServerOpensWindowDoor({
    required HistoryModel history,
    required UnitModel unit,
  }) = _ServerOpensWindowDoor;

  factory ServerOpensWindowDoor.fromJson(Map<String, Object?> json) =>
      _$ServerOpensWindowDoorFromJson(json);
}