// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitModelImpl _$$UnitModelImplFromJson(Map<String, dynamic> json) =>
    _$UnitModelImpl(
      unitId: (json['unitId'] as num).toInt(),
      name: json['name'] as String,
      unitType: $enumDecode(_$UnitTypeEnumMap, json['unitType']),
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UnitModelImplToJson(_$UnitModelImpl instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'name': instance.name,
      'unitType': _$UnitTypeEnumMap[instance.unitType]!,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$UnitTypeEnumMap = {
  UnitType.Door: 0,
  UnitType.Window: 1,
  UnitType.MotionSensor: 2,
};

const _$StatusEnumMap = {
  Status.Armed: 0,
  Status.Disarmed: 1,
  Status.Triggeret: 2,
  Status.Closed: 3,
  Status.Open: 4,
};
