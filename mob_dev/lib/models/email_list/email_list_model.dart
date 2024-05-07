import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'email_list_model.freezed.dart';

part 'email_list_model.g.dart';

@freezed
class EmailListModel with _$EmailListModel {
  factory EmailListModel({required int id, required String mail}) =
      _EmailListModel;

  factory EmailListModel.fromJson(Map<String, Object?> json) =>
      _$EmailListModelFromJson(json);
}
