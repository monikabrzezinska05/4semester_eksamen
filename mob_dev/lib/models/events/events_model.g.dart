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

_$ClientWantsToTurnOffAlarmImpl _$$ClientWantsToTurnOffAlarmImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToTurnOffAlarmImpl(
      eventType: json['eventType'] as String,
      historyModel:
          HistoryModel.fromJson(json['historyModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientWantsToTurnOffAlarmImplToJson(
        _$ClientWantsToTurnOffAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyModel': instance.historyModel,
    };

_$ClientWantsToTurnOnAlarmImpl _$$ClientWantsToTurnOnAlarmImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToTurnOnAlarmImpl(
      eventType: json['eventType'] as String,
      historyModel:
          HistoryModel.fromJson(json['historyModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientWantsToTurnOnAlarmImplToJson(
        _$ClientWantsToTurnOnAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyModel': instance.historyModel,
    };

_$ClientWantsToTurnOffMotionAlarmImpl
    _$$ClientWantsToTurnOffMotionAlarmImplFromJson(Map<String, dynamic> json) =>
        _$ClientWantsToTurnOffMotionAlarmImpl(
          eventType: json['eventType'] as String,
          historyModel: HistoryModel.fromJson(
              json['historyModel'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ClientWantsToTurnOffMotionAlarmImplToJson(
        _$ClientWantsToTurnOffMotionAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyModel': instance.historyModel,
    };

_$ClientWantsToTurnOnMotionAlarmImpl
    _$$ClientWantsToTurnOnMotionAlarmImplFromJson(Map<String, dynamic> json) =>
        _$ClientWantsToTurnOnMotionAlarmImpl(
          eventType: json['eventType'] as String,
          historyModel: HistoryModel.fromJson(
              json['historyModel'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ClientWantsToTurnOnMotionAlarmImplToJson(
        _$ClientWantsToTurnOnMotionAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'historyModel': instance.historyModel,
    };

_$ClientWantsToDeAuthenticateImpl _$$ClientWantsToDeAuthenticateImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientWantsToDeAuthenticateImpl(
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$ClientWantsToDeAuthenticateImplToJson(
        _$ClientWantsToDeAuthenticateImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
    };

_$ServerSensesMotionImpl _$$ServerSensesMotionImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerSensesMotionImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerSensesMotionImplToJson(
        _$ServerSensesMotionImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
      'unit': instance.unit,
    };

_$ServerStopsSensingMotionImpl _$$ServerStopsSensingMotionImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerStopsSensingMotionImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerStopsSensingMotionImplToJson(
        _$ServerStopsSensingMotionImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
      'unit': instance.unit,
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

_$ServerLocksDoorImpl _$$ServerLocksDoorImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerLocksDoorImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerLocksDoorImplToJson(
        _$ServerLocksDoorImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
      'unit': instance.unit,
    };

_$ServerUnlocksDoorImpl _$$ServerUnlocksDoorImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerUnlocksDoorImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerUnlocksDoorImplToJson(
        _$ServerUnlocksDoorImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
      'unit': instance.unit,
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

_$ServerHasActivatedAlarmImpl _$$ServerHasActivatedAlarmImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerHasActivatedAlarmImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerHasActivatedAlarmImplToJson(
        _$ServerHasActivatedAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
    };

_$ServerHasDeactivatedAlarmImpl _$$ServerHasDeactivatedAlarmImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerHasDeactivatedAlarmImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerHasDeactivatedAlarmImplToJson(
        _$ServerHasDeactivatedAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
    };

_$ServerHasActivatedMotionSensorAlarmImpl
    _$$ServerHasActivatedMotionSensorAlarmImplFromJson(
            Map<String, dynamic> json) =>
        _$ServerHasActivatedMotionSensorAlarmImpl(
          eventType: json['eventType'] as String,
          history:
              HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ServerHasActivatedMotionSensorAlarmImplToJson(
        _$ServerHasActivatedMotionSensorAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
    };

_$ServerHasDeactivatedMotionSensorAlarmImpl
    _$$ServerHasDeactivatedMotionSensorAlarmImplFromJson(
            Map<String, dynamic> json) =>
        _$ServerHasDeactivatedMotionSensorAlarmImpl(
          eventType: json['eventType'] as String,
          history:
              HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ServerHasDeactivatedMotionSensorAlarmImplToJson(
        _$ServerHasDeactivatedMotionSensorAlarmImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
    };

_$ServerAlarmTriggeredImpl _$$ServerAlarmTriggeredImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerAlarmTriggeredImpl(
      eventType: json['eventType'] as String,
      history: HistoryModel.fromJson(json['history'] as Map<String, dynamic>),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServerAlarmTriggeredImplToJson(
        _$ServerAlarmTriggeredImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'history': instance.history,
      'unit': instance.unit,
    };
