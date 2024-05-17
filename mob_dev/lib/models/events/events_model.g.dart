// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientWantsToLoginImpl _$$ClientWantsToLoginImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToLoginImpl(
      eventType: json['eventType'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$ClientWantsToLoginImplToJson(
        _$ClientWantsToLoginImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'email': instance.email,
      'password': instance.password,
    };

_$ClientWantsToSeeUnitsImpl _$$ClientWantsToSeeUnitsImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToSeeUnitsImpl(
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$ClientWantsToSeeUnitsImplToJson(
        _$ClientWantsToSeeUnitsImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
    };

_$ClientWantsToSeeHistoryImpl _$$ClientWantsToSeeHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToSeeHistoryImpl(
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$ClientWantsToSeeHistoryImplToJson(
        _$ClientWantsToSeeHistoryImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
    };

_$ClientWantsToSeeEmailsImpl _$$ClientWantsToSeeEmailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToSeeEmailsImpl(
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$ClientWantsToSeeEmailsImplToJson(
        _$ClientWantsToSeeEmailsImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
    };

_$ServerShowsEmailListImpl _$$ServerShowsEmailListImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerShowsEmailListImpl(
      eventType: json['eventType'] as String,
      emails: (json['emails'] as List<dynamic>)
          .map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServerShowsEmailListImplToJson(
        _$ServerShowsEmailListImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'emails': instance.emails,
    };

_$ServerShowsHistoryImpl _$$ServerShowsHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerShowsHistoryImpl(
      eventType: json['eventType'] as String,
      historyList: (json['historyList'] as List<dynamic>)
          .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServerShowsHistoryImplToJson(
        _$ServerShowsHistoryImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyList': instance.historyList,
    };

_$ServerShowsUnitsImpl _$$ServerShowsUnitsImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerShowsUnitsImpl(
      eventType: json['eventType'] as String,
      unitList: (json['unitList'] as List<dynamic>)
          .map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServerShowsUnitsImplToJson(
        _$ServerShowsUnitsImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'unitList': instance.unitList,
    };
