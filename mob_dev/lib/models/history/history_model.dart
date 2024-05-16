import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../unit/unit_model.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';


@freezed
class HistoryModel with _$HistoryModel {
   factory HistoryModel({
    required int historyId,
    required UnitModel unit,
    required String? personName,
    required EventType eventType,
    required DateTime date,
  }) = _HistoryElementModel;

  factory HistoryModel.fromJson(Map<String, Object?> json) => _$HistoryModelFromJson(json);
}


enum EventType {
  @JsonValue(0)Open,
  @JsonValue(1)Close,
  @JsonValue(2)AlarmTriggered,
  @JsonValue(3)AlarmStopped,
  @JsonValue(4)AlarmArmed,
  @JsonValue(5)AlarmDisarmed,
}