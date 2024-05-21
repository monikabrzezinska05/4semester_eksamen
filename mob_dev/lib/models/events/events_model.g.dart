// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientWantsToLoginImpl _$$ClientWantsToLoginImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToLoginImpl(
      eventType: json['eventType'] as String,
      userLogin:
          UserLoginModel.fromJson(json['userLogin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientWantsToLoginImplToJson(
        _$ClientWantsToLoginImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'userLogin': instance.userLogin,
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

_$ClientWantsToCreateEmailImpl _$$ClientWantsToCreateEmailImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToCreateEmailImpl(
      eventType: json['eventType'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$ClientWantsToCreateEmailImplToJson(
        _$ClientWantsToCreateEmailImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'email': instance.email,
    };

_$ClientWantsToDeleteEmailImpl _$$ClientWantsToDeleteEmailImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToDeleteEmailImpl(
      eventType: json['eventType'] as String,
      emailId: (json['emailId'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientWantsToDeleteEmailImplToJson(
        _$ClientWantsToDeleteEmailImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'emailId': instance.emailId,
    };

_$ServerShowsEmailsImpl _$$ServerShowsEmailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerShowsEmailsImpl(
      eventType: json['eventType'] as String,
      emails: (json['emails'] as List<dynamic>)
          .map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServerShowsEmailsImplToJson(
        _$ServerShowsEmailsImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'emails': instance.emails,
    };

_$ServerCreatesEmailImpl _$$ServerCreatesEmailImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerCreatesEmailImpl(
      eventType: json['eventType'] as String,
      email: EmailModel.fromJson(json['email'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerCreatesEmailImplToJson(
        _$ServerCreatesEmailImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'email': instance.email,
    };

_$ServerDeletesEmailImpl _$$ServerDeletesEmailImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerDeletesEmailImpl(
      eventType: json['eventType'] as String,
      success: json['success'] as bool,
      emailId: (json['emailId'] as num).toInt(),
    );

Map<String, dynamic> _$$ServerDeletesEmailImplToJson(
        _$ServerDeletesEmailImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'success': instance.success,
      'emailId': instance.emailId,
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

_$ServerAuthenticatesUserImpl _$$ServerAuthenticatesUserImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerAuthenticatesUserImpl(
      eventType: json['eventType'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      jwt: json['jwt'] as String,
    );

Map<String, dynamic> _$$ServerAuthenticatesUserImplToJson(
        _$ServerAuthenticatesUserImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'user': instance.user,
      'jwt': instance.jwt,
    };

_$ServerDeAuthenticatesUserImpl _$$ServerDeAuthenticatesUserImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerDeAuthenticatesUserImpl(
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$ServerDeAuthenticatesUserImplToJson(
        _$ServerDeAuthenticatesUserImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
    };

_$ServerClosesWindowDoorImpl _$$ServerClosesWindowDoorImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerClosesWindowDoorImpl(
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerClosesWindowDoorImplToJson(
        _$ServerClosesWindowDoorImpl instance) =>
    <String, dynamic>{
      'history': instance.history,
      'unit': instance.unit,
    };

_$ServerOpensWindowDoorImpl _$$ServerOpensWindowDoorImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerOpensWindowDoorImpl(
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerOpensWindowDoorImplToJson(
        _$ServerOpensWindowDoorImpl instance) =>
    <String, dynamic>{
      'history': instance.history,
      'unit': instance.unit,
    };
