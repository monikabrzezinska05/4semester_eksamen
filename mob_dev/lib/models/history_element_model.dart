import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'history_element_model.freezed.dart';
part 'history_element_model.g.dart';


@freezed
class HistoryElementModel with _$HistoryElementModel {
   factory HistoryElementModel({
    required int historyId,
    required String unitName,
    required String personName,
    required EventType eventType,
    required DateTime date,
  }) = _HistoryElementModel;

  factory HistoryElementModel.fromJson(Map<String, Object?> json) => _$HistoryElementModelFromJson(json);
}


enum EventType {
  Open,
  Close,
  AlarmTriggered,
  AlarmStopped,
  AlarmArmed,
  AlarmDisarmed,
}