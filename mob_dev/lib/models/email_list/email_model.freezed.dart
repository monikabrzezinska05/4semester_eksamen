// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailModel _$EmailModelFromJson(Map<String, dynamic> json) {
  return _EmailModel.fromJson(json);
}

/// @nodoc
mixin _$EmailModel {
  int get id => throw _privateConstructorUsedError;
  String get mail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailModelCopyWith<EmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailModelCopyWith<$Res> {
  factory $EmailModelCopyWith(
          EmailModel value, $Res Function(EmailModel) then) =
      _$EmailModelCopyWithImpl<$Res, EmailModel>;
  @useResult
  $Res call({int id, String mail});
}

/// @nodoc
class _$EmailModelCopyWithImpl<$Res, $Val extends EmailModel>
    implements $EmailModelCopyWith<$Res> {
  _$EmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailModelImplCopyWith<$Res>
    implements $EmailModelCopyWith<$Res> {
  factory _$$EmailModelImplCopyWith(
          _$EmailModelImpl value, $Res Function(_$EmailModelImpl) then) =
      __$$EmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String mail});
}

/// @nodoc
class __$$EmailModelImplCopyWithImpl<$Res>
    extends _$EmailModelCopyWithImpl<$Res, _$EmailModelImpl>
    implements _$$EmailModelImplCopyWith<$Res> {
  __$$EmailModelImplCopyWithImpl(
      _$EmailModelImpl _value, $Res Function(_$EmailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mail = null,
  }) {
    return _then(_$EmailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailModelImpl with DiagnosticableTreeMixin implements _EmailModel {
  _$EmailModelImpl({required this.id, required this.mail});

  factory _$EmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String mail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmailModel(id: $id, mail: $mail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmailModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('mail', mail));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mail, mail) || other.mail == mail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailModelImplCopyWith<_$EmailModelImpl> get copyWith =>
      __$$EmailModelImplCopyWithImpl<_$EmailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailModelImplToJson(
      this,
    );
  }
}

abstract class _EmailModel implements EmailModel {
  factory _EmailModel({required final int id, required final String mail}) =
      _$EmailModelImpl;

  factory _EmailModel.fromJson(Map<String, dynamic> json) =
      _$EmailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get mail;
  @override
  @JsonKey(ignore: true)
  _$$EmailModelImplCopyWith<_$EmailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
