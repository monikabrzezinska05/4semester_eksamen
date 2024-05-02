import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitModel with _$UnitModel {
   factory UnitModel({
    required int unitId,
    required String name,
    required UnitType unitType,
    required bool status,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, Object?> json) => _$UnitModelFromJson(json);
}

enum UnitType {
  Door,
  Window,
  MotionSensor,
}