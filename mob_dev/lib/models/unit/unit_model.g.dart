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
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$UnitModelImplToJson(_$UnitModelImpl instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'name': instance.name,
      'unitType': _$UnitTypeEnumMap[instance.unitType]!,
      'status': instance.status,
    };

const _$UnitTypeEnumMap = {
  UnitType.Door: 'Door',
  UnitType.Window: 'Window',
  UnitType.MotionSensor: 'MotionSensor',
};
