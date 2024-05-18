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
    required Status status,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, Object?> json) => _$UnitModelFromJson(json);
}

enum Status {
  @JsonValue(0)Armed,
  @JsonValue(1)Disarmed,
  @JsonValue(2)Triggeret,
  @JsonValue(3)Closed,
  @JsonValue(4)Open,
}

enum UnitType {
  @JsonValue(0)Door,
  @JsonValue(1)Window,
  @JsonValue(2)MotionSensor,
}