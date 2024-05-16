// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryElementModelImpl _$$HistoryElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryElementModelImpl(
      historyId: (json['historyId'] as num).toInt(),
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
      personName: json['personName'] as String?,
      eventType: $enumDecode(_$EventTypeEnumMap, json['eventType']),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$HistoryElementModelImplToJson(
        _$HistoryElementModelImpl instance) =>
    <String, dynamic>{
      'historyId': instance.historyId,
      'unit': instance.unit,
      'personName': instance.personName,
      'eventType': _$EventTypeEnumMap[instance.eventType]!,
      'date': instance.date.toIso8601String(),
    };

const _$EventTypeEnumMap = {
  EventType.Open: 0,
  EventType.Close: 1,
  EventType.AlarmTriggered: 2,
  EventType.AlarmStopped: 3,
  EventType.AlarmArmed: 4,
  EventType.AlarmDisarmed: 5,
};
