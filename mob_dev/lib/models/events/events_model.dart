import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mob_dev/models/email_list/email_model.dart';
import 'package:mob_dev/models/unit/unit_model.dart';

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
    required String email,
    required String password,
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



class ServerEvent extends BaseEvent {
  static ServerEvent fromJson(Map<String, Object?> json) {
    final type = json['eventType'];
    return switch (type) {
      ServerShowsHistory.name => ServerShowsHistory.fromJson(json),
      _ => throw "Unknown event type: $type in $json"
    };
  }
}

class ServerAlarmTriggered extends ServerEvent  {
  static const String name = "ServerAlarmTriggered";

  ServerAlarmTriggered({
    required this.eventType,
    required this. historyModel,
  });
  final String eventType;
  final HistoryModel historyModel;
}

@freezed
class ServerShowsEmailList extends ServerEvent with _$ServerShowsEmailList {
  static const String name = "ServerShowsEmailList";

  const factory ServerShowsEmailList({
    required String eventType,
    required List<EmailModel> emails,
  }) = _ServerShowsEmailList;

  factory ServerShowsEmailList.fromJson(Map<String, Object?> json) =>
      _$ServerShowsEmailListFromJson(json);
}

@freezed
class ServerShowsHistory extends ServerEvent  with _$ServerShowsHistory{
  static const String name = "ServerShowsHistory";

  const factory ServerShowsHistory({
    required String eventType,
    required  List<HistoryModel> historyList,
  }) = _ServerShowsHistory;

  factory ServerShowsHistory.fromJson(Map<String, Object?> json) =>
      _$ServerShowsHistoryFromJson(json);
}

@freezed
class ServerShowsUnits extends ServerEvent with _$ServerShowsUnits {
  static const String name = "ServerShowsUnits";

 const factory ServerShowsUnits({
    required String eventType,
    required List<UnitModel> units,
  }) = _ServerShowsUnits;

  factory ServerShowsUnits.fromJson(Map<String, Object?> json) =>
      _$ServerShowsUnitsFromJson(json);
}