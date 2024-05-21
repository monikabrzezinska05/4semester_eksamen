import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'email_model.freezed.dart';

part 'email_model.g.dart';

@freezed
class EmailModel with _$EmailModel {
  factory EmailModel({required int id, required String mail}) =
      _EmailModel;

  factory EmailModel.fromJson(Map<String, Object?> json) =>
      _$EmailModelFromJson(json);
}
