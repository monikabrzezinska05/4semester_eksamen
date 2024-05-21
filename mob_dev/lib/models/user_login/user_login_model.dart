import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_model.freezed.dart';
part 'user_login_model.g.dart';

@freezed
class UserLoginModel with _$UserLoginModel {
  factory UserLoginModel({
    required String email,
    required String password,
  }) = _UserLoginModel;

  factory UserLoginModel.fromJson(Map<String, Object?> json) =>
      _$UserLoginModelFromJson(json);
}