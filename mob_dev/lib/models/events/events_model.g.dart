// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientClosesWindowDoorImpl _$$ClientClosesWindowDoorImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientClosesWindowDoorImpl(
      eventType: json['eventType'] as String,
      historyModel:
          HistoryModel.fromJson(json['historyModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientClosesWindowDoorImplToJson(
        _$ClientClosesWindowDoorImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyModel': instance.historyModel,
    };

_$ClientOpensWindowDoorImpl _$$ClientOpensWindowDoorImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientOpensWindowDoorImpl(
      eventType: json['eventType'] as String,
      historyModel:
          HistoryModel.fromJson(json['historyModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientOpensWindowDoorImplToJson(
        _$ClientOpensWindowDoorImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyModel': instance.historyModel,
    };

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
