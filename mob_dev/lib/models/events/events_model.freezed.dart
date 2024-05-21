// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientWantsToLogin _$ClientWantsToLoginFromJson(Map<String, dynamic> json) {
  return _ClientWantsToLogin.fromJson(json);
}

/// @nodoc
mixin _$ClientWantsToLogin {
  String get eventType => throw _privateConstructorUsedError;
  UserLoginModel get userLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientWantsToLoginCopyWith<ClientWantsToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientWantsToLoginCopyWith<$Res> {
  factory $ClientWantsToLoginCopyWith(
          ClientWantsToLogin value, $Res Function(ClientWantsToLogin) then) =
      _$ClientWantsToLoginCopyWithImpl<$Res, ClientWantsToLogin>;
  @useResult
  $Res call({String eventType, UserLoginModel userLogin});

  $UserLoginModelCopyWith<$Res> get userLogin;
}

/// @nodoc
class _$ClientWantsToLoginCopyWithImpl<$Res, $Val extends ClientWantsToLogin>
    implements $ClientWantsToLoginCopyWith<$Res> {
  _$ClientWantsToLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? userLogin = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      userLogin: null == userLogin
          ? _value.userLogin
          : userLogin // ignore: cast_nullable_to_non_nullable
              as UserLoginModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLoginModelCopyWith<$Res> get userLogin {
    return $UserLoginModelCopyWith<$Res>(_value.userLogin, (value) {
      return _then(_value.copyWith(userLogin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientWantsToLoginImplCopyWith<$Res>
    implements $ClientWantsToLoginCopyWith<$Res> {
  factory _$$ClientWantsToLoginImplCopyWith(_$ClientWantsToLoginImpl value,
          $Res Function(_$ClientWantsToLoginImpl) then) =
      __$$ClientWantsToLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, UserLoginModel userLogin});

  @override
  $UserLoginModelCopyWith<$Res> get userLogin;
}

/// @nodoc
class __$$ClientWantsToLoginImplCopyWithImpl<$Res>
    extends _$ClientWantsToLoginCopyWithImpl<$Res, _$ClientWantsToLoginImpl>
    implements _$$ClientWantsToLoginImplCopyWith<$Res> {
  __$$ClientWantsToLoginImplCopyWithImpl(_$ClientWantsToLoginImpl _value,
      $Res Function(_$ClientWantsToLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? userLogin = null,
  }) {
    return _then(_$ClientWantsToLoginImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      userLogin: null == userLogin
          ? _value.userLogin
          : userLogin // ignore: cast_nullable_to_non_nullable
              as UserLoginModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToLoginImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToLogin {
  const _$ClientWantsToLoginImpl(
      {required this.eventType, required this.userLogin});

  factory _$ClientWantsToLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToLoginImplFromJson(json);

  @override
  final String eventType;
  @override
  final UserLoginModel userLogin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToLogin(eventType: $eventType, userLogin: $userLogin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToLogin'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('userLogin', userLogin));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToLoginImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.userLogin, userLogin) ||
                other.userLogin == userLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, userLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientWantsToLoginImplCopyWith<_$ClientWantsToLoginImpl> get copyWith =>
      __$$ClientWantsToLoginImplCopyWithImpl<_$ClientWantsToLoginImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientWantsToLoginImplToJson(
      this,
    );
  }
}

abstract class _ClientWantsToLogin implements ClientWantsToLogin {
  const factory _ClientWantsToLogin(
      {required final String eventType,
      required final UserLoginModel userLogin}) = _$ClientWantsToLoginImpl;

  factory _ClientWantsToLogin.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToLoginImpl.fromJson;

  @override
  String get eventType;
  @override
  UserLoginModel get userLogin;
  @override
  @JsonKey(ignore: true)
  _$$ClientWantsToLoginImplCopyWith<_$ClientWantsToLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientWantsToSeeUnits _$ClientWantsToSeeUnitsFromJson(
    Map<String, dynamic> json) {
  return _ClientWantsToSeeUnits.fromJson(json);
}

/// @nodoc
mixin _$ClientWantsToSeeUnits {
  String get eventType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientWantsToSeeUnitsCopyWith<ClientWantsToSeeUnits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientWantsToSeeUnitsCopyWith<$Res> {
  factory $ClientWantsToSeeUnitsCopyWith(ClientWantsToSeeUnits value,
          $Res Function(ClientWantsToSeeUnits) then) =
      _$ClientWantsToSeeUnitsCopyWithImpl<$Res, ClientWantsToSeeUnits>;
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class _$ClientWantsToSeeUnitsCopyWithImpl<$Res,
        $Val extends ClientWantsToSeeUnits>
    implements $ClientWantsToSeeUnitsCopyWith<$Res> {
  _$ClientWantsToSeeUnitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientWantsToSeeUnitsImplCopyWith<$Res>
    implements $ClientWantsToSeeUnitsCopyWith<$Res> {
  factory _$$ClientWantsToSeeUnitsImplCopyWith(
          _$ClientWantsToSeeUnitsImpl value,
          $Res Function(_$ClientWantsToSeeUnitsImpl) then) =
      __$$ClientWantsToSeeUnitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$ClientWantsToSeeUnitsImplCopyWithImpl<$Res>
    extends _$ClientWantsToSeeUnitsCopyWithImpl<$Res,
        _$ClientWantsToSeeUnitsImpl>
    implements _$$ClientWantsToSeeUnitsImplCopyWith<$Res> {
  __$$ClientWantsToSeeUnitsImplCopyWithImpl(_$ClientWantsToSeeUnitsImpl _value,
      $Res Function(_$ClientWantsToSeeUnitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$ClientWantsToSeeUnitsImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToSeeUnitsImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToSeeUnits {
  const _$ClientWantsToSeeUnitsImpl({required this.eventType});

  factory _$ClientWantsToSeeUnitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToSeeUnitsImplFromJson(json);

  @override
  final String eventType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToSeeUnits(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToSeeUnits'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToSeeUnitsImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientWantsToSeeUnitsImplCopyWith<_$ClientWantsToSeeUnitsImpl>
      get copyWith => __$$ClientWantsToSeeUnitsImplCopyWithImpl<
          _$ClientWantsToSeeUnitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientWantsToSeeUnitsImplToJson(
      this,
    );
  }
}

abstract class _ClientWantsToSeeUnits implements ClientWantsToSeeUnits {
  const factory _ClientWantsToSeeUnits({required final String eventType}) =
      _$ClientWantsToSeeUnitsImpl;

  factory _ClientWantsToSeeUnits.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToSeeUnitsImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$ClientWantsToSeeUnitsImplCopyWith<_$ClientWantsToSeeUnitsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClientWantsToSeeHistory _$ClientWantsToSeeHistoryFromJson(
    Map<String, dynamic> json) {
  return _ClientWantsToSeeHistory.fromJson(json);
}

/// @nodoc
mixin _$ClientWantsToSeeHistory {
  String get eventType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientWantsToSeeHistoryCopyWith<ClientWantsToSeeHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientWantsToSeeHistoryCopyWith<$Res> {
  factory $ClientWantsToSeeHistoryCopyWith(ClientWantsToSeeHistory value,
          $Res Function(ClientWantsToSeeHistory) then) =
      _$ClientWantsToSeeHistoryCopyWithImpl<$Res, ClientWantsToSeeHistory>;
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class _$ClientWantsToSeeHistoryCopyWithImpl<$Res,
        $Val extends ClientWantsToSeeHistory>
    implements $ClientWantsToSeeHistoryCopyWith<$Res> {
  _$ClientWantsToSeeHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientWantsToSeeHistoryImplCopyWith<$Res>
    implements $ClientWantsToSeeHistoryCopyWith<$Res> {
  factory _$$ClientWantsToSeeHistoryImplCopyWith(
          _$ClientWantsToSeeHistoryImpl value,
          $Res Function(_$ClientWantsToSeeHistoryImpl) then) =
      __$$ClientWantsToSeeHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$ClientWantsToSeeHistoryImplCopyWithImpl<$Res>
    extends _$ClientWantsToSeeHistoryCopyWithImpl<$Res,
        _$ClientWantsToSeeHistoryImpl>
    implements _$$ClientWantsToSeeHistoryImplCopyWith<$Res> {
  __$$ClientWantsToSeeHistoryImplCopyWithImpl(
      _$ClientWantsToSeeHistoryImpl _value,
      $Res Function(_$ClientWantsToSeeHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$ClientWantsToSeeHistoryImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToSeeHistoryImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToSeeHistory {
  const _$ClientWantsToSeeHistoryImpl({required this.eventType});

  factory _$ClientWantsToSeeHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToSeeHistoryImplFromJson(json);

  @override
  final String eventType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToSeeHistory(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToSeeHistory'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToSeeHistoryImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientWantsToSeeHistoryImplCopyWith<_$ClientWantsToSeeHistoryImpl>
      get copyWith => __$$ClientWantsToSeeHistoryImplCopyWithImpl<
          _$ClientWantsToSeeHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientWantsToSeeHistoryImplToJson(
      this,
    );
  }
}

abstract class _ClientWantsToSeeHistory implements ClientWantsToSeeHistory {
  const factory _ClientWantsToSeeHistory({required final String eventType}) =
      _$ClientWantsToSeeHistoryImpl;

  factory _ClientWantsToSeeHistory.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToSeeHistoryImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$ClientWantsToSeeHistoryImplCopyWith<_$ClientWantsToSeeHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClientWantsToSeeEmails _$ClientWantsToSeeEmailsFromJson(
    Map<String, dynamic> json) {
  return _ClientWantsToSeeEmails.fromJson(json);
}

/// @nodoc
mixin _$ClientWantsToSeeEmails {
  String get eventType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientWantsToSeeEmailsCopyWith<ClientWantsToSeeEmails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientWantsToSeeEmailsCopyWith<$Res> {
  factory $ClientWantsToSeeEmailsCopyWith(ClientWantsToSeeEmails value,
          $Res Function(ClientWantsToSeeEmails) then) =
      _$ClientWantsToSeeEmailsCopyWithImpl<$Res, ClientWantsToSeeEmails>;
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class _$ClientWantsToSeeEmailsCopyWithImpl<$Res,
        $Val extends ClientWantsToSeeEmails>
    implements $ClientWantsToSeeEmailsCopyWith<$Res> {
  _$ClientWantsToSeeEmailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientWantsToSeeEmailsImplCopyWith<$Res>
    implements $ClientWantsToSeeEmailsCopyWith<$Res> {
  factory _$$ClientWantsToSeeEmailsImplCopyWith(
          _$ClientWantsToSeeEmailsImpl value,
          $Res Function(_$ClientWantsToSeeEmailsImpl) then) =
      __$$ClientWantsToSeeEmailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$ClientWantsToSeeEmailsImplCopyWithImpl<$Res>
    extends _$ClientWantsToSeeEmailsCopyWithImpl<$Res,
        _$ClientWantsToSeeEmailsImpl>
    implements _$$ClientWantsToSeeEmailsImplCopyWith<$Res> {
  __$$ClientWantsToSeeEmailsImplCopyWithImpl(
      _$ClientWantsToSeeEmailsImpl _value,
      $Res Function(_$ClientWantsToSeeEmailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$ClientWantsToSeeEmailsImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToSeeEmailsImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToSeeEmails {
  const _$ClientWantsToSeeEmailsImpl({required this.eventType});

  factory _$ClientWantsToSeeEmailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToSeeEmailsImplFromJson(json);

  @override
  final String eventType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToSeeEmails(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToSeeEmails'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToSeeEmailsImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientWantsToSeeEmailsImplCopyWith<_$ClientWantsToSeeEmailsImpl>
      get copyWith => __$$ClientWantsToSeeEmailsImplCopyWithImpl<
          _$ClientWantsToSeeEmailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientWantsToSeeEmailsImplToJson(
      this,
    );
  }
}

abstract class _ClientWantsToSeeEmails implements ClientWantsToSeeEmails {
  const factory _ClientWantsToSeeEmails({required final String eventType}) =
      _$ClientWantsToSeeEmailsImpl;

  factory _ClientWantsToSeeEmails.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToSeeEmailsImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$ClientWantsToSeeEmailsImplCopyWith<_$ClientWantsToSeeEmailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClientWantsToCreateEmail _$ClientWantsToCreateEmailFromJson(
    Map<String, dynamic> json) {
  return _ClientWantsToCreateEmail.fromJson(json);
}

/// @nodoc
mixin _$ClientWantsToCreateEmail {
  String get eventType => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientWantsToCreateEmailCopyWith<ClientWantsToCreateEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientWantsToCreateEmailCopyWith<$Res> {
  factory $ClientWantsToCreateEmailCopyWith(ClientWantsToCreateEmail value,
          $Res Function(ClientWantsToCreateEmail) then) =
      _$ClientWantsToCreateEmailCopyWithImpl<$Res, ClientWantsToCreateEmail>;
  @useResult
  $Res call({String eventType, String email});
}

/// @nodoc
class _$ClientWantsToCreateEmailCopyWithImpl<$Res,
        $Val extends ClientWantsToCreateEmail>
    implements $ClientWantsToCreateEmailCopyWith<$Res> {
  _$ClientWantsToCreateEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientWantsToCreateEmailImplCopyWith<$Res>
    implements $ClientWantsToCreateEmailCopyWith<$Res> {
  factory _$$ClientWantsToCreateEmailImplCopyWith(
          _$ClientWantsToCreateEmailImpl value,
          $Res Function(_$ClientWantsToCreateEmailImpl) then) =
      __$$ClientWantsToCreateEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String email});
}

/// @nodoc
class __$$ClientWantsToCreateEmailImplCopyWithImpl<$Res>
    extends _$ClientWantsToCreateEmailCopyWithImpl<$Res,
        _$ClientWantsToCreateEmailImpl>
    implements _$$ClientWantsToCreateEmailImplCopyWith<$Res> {
  __$$ClientWantsToCreateEmailImplCopyWithImpl(
      _$ClientWantsToCreateEmailImpl _value,
      $Res Function(_$ClientWantsToCreateEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? email = null,
  }) {
    return _then(_$ClientWantsToCreateEmailImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToCreateEmailImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToCreateEmail {
  const _$ClientWantsToCreateEmailImpl(
      {required this.eventType, required this.email});

  factory _$ClientWantsToCreateEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToCreateEmailImplFromJson(json);

  @override
  final String eventType;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToCreateEmail(eventType: $eventType, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToCreateEmail'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToCreateEmailImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientWantsToCreateEmailImplCopyWith<_$ClientWantsToCreateEmailImpl>
      get copyWith => __$$ClientWantsToCreateEmailImplCopyWithImpl<
          _$ClientWantsToCreateEmailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientWantsToCreateEmailImplToJson(
      this,
    );
  }
}

abstract class _ClientWantsToCreateEmail implements ClientWantsToCreateEmail {
  const factory _ClientWantsToCreateEmail(
      {required final String eventType,
      required final String email}) = _$ClientWantsToCreateEmailImpl;

  factory _ClientWantsToCreateEmail.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToCreateEmailImpl.fromJson;

  @override
  String get eventType;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ClientWantsToCreateEmailImplCopyWith<_$ClientWantsToCreateEmailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClientWantsToDeleteEmail _$ClientWantsToDeleteEmailFromJson(
    Map<String, dynamic> json) {
  return _ClientWantsToDeleteEmail.fromJson(json);
}

/// @nodoc
mixin _$ClientWantsToDeleteEmail {
  String get eventType => throw _privateConstructorUsedError;
  int get emailId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientWantsToDeleteEmailCopyWith<ClientWantsToDeleteEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientWantsToDeleteEmailCopyWith<$Res> {
  factory $ClientWantsToDeleteEmailCopyWith(ClientWantsToDeleteEmail value,
          $Res Function(ClientWantsToDeleteEmail) then) =
      _$ClientWantsToDeleteEmailCopyWithImpl<$Res, ClientWantsToDeleteEmail>;
  @useResult
  $Res call({String eventType, int emailId});
}

/// @nodoc
class _$ClientWantsToDeleteEmailCopyWithImpl<$Res,
        $Val extends ClientWantsToDeleteEmail>
    implements $ClientWantsToDeleteEmailCopyWith<$Res> {
  _$ClientWantsToDeleteEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? emailId = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientWantsToDeleteEmailImplCopyWith<$Res>
    implements $ClientWantsToDeleteEmailCopyWith<$Res> {
  factory _$$ClientWantsToDeleteEmailImplCopyWith(
          _$ClientWantsToDeleteEmailImpl value,
          $Res Function(_$ClientWantsToDeleteEmailImpl) then) =
      __$$ClientWantsToDeleteEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, int emailId});
}

/// @nodoc
class __$$ClientWantsToDeleteEmailImplCopyWithImpl<$Res>
    extends _$ClientWantsToDeleteEmailCopyWithImpl<$Res,
        _$ClientWantsToDeleteEmailImpl>
    implements _$$ClientWantsToDeleteEmailImplCopyWith<$Res> {
  __$$ClientWantsToDeleteEmailImplCopyWithImpl(
      _$ClientWantsToDeleteEmailImpl _value,
      $Res Function(_$ClientWantsToDeleteEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? emailId = null,
  }) {
    return _then(_$ClientWantsToDeleteEmailImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToDeleteEmailImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToDeleteEmail {
  const _$ClientWantsToDeleteEmailImpl(
      {required this.eventType, required this.emailId});

  factory _$ClientWantsToDeleteEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToDeleteEmailImplFromJson(json);

  @override
  final String eventType;
  @override
  final int emailId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToDeleteEmail(eventType: $eventType, emailId: $emailId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToDeleteEmail'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('emailId', emailId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToDeleteEmailImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.emailId, emailId) || other.emailId == emailId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, emailId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientWantsToDeleteEmailImplCopyWith<_$ClientWantsToDeleteEmailImpl>
      get copyWith => __$$ClientWantsToDeleteEmailImplCopyWithImpl<
          _$ClientWantsToDeleteEmailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientWantsToDeleteEmailImplToJson(
      this,
    );
  }
}

abstract class _ClientWantsToDeleteEmail implements ClientWantsToDeleteEmail {
  const factory _ClientWantsToDeleteEmail(
      {required final String eventType,
      required final int emailId}) = _$ClientWantsToDeleteEmailImpl;

  factory _ClientWantsToDeleteEmail.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToDeleteEmailImpl.fromJson;

  @override
  String get eventType;
  @override
  int get emailId;
  @override
  @JsonKey(ignore: true)
  _$$ClientWantsToDeleteEmailImplCopyWith<_$ClientWantsToDeleteEmailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServerShowsEmails _$ServerShowsEmailsFromJson(Map<String, dynamic> json) {
  return _ServerShowsEmails.fromJson(json);
}

/// @nodoc
mixin _$ServerShowsEmails {
  String get eventType => throw _privateConstructorUsedError;
  List<EmailModel> get emails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerShowsEmailsCopyWith<ServerShowsEmails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerShowsEmailsCopyWith<$Res> {
  factory $ServerShowsEmailsCopyWith(
          ServerShowsEmails value, $Res Function(ServerShowsEmails) then) =
      _$ServerShowsEmailsCopyWithImpl<$Res, ServerShowsEmails>;
  @useResult
  $Res call({String eventType, List<EmailModel> emails});
}

/// @nodoc
class _$ServerShowsEmailsCopyWithImpl<$Res, $Val extends ServerShowsEmails>
    implements $ServerShowsEmailsCopyWith<$Res> {
  _$ServerShowsEmailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? emails = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      emails: null == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<EmailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerShowsEmailsImplCopyWith<$Res>
    implements $ServerShowsEmailsCopyWith<$Res> {
  factory _$$ServerShowsEmailsImplCopyWith(_$ServerShowsEmailsImpl value,
          $Res Function(_$ServerShowsEmailsImpl) then) =
      __$$ServerShowsEmailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, List<EmailModel> emails});
}

/// @nodoc
class __$$ServerShowsEmailsImplCopyWithImpl<$Res>
    extends _$ServerShowsEmailsCopyWithImpl<$Res, _$ServerShowsEmailsImpl>
    implements _$$ServerShowsEmailsImplCopyWith<$Res> {
  __$$ServerShowsEmailsImplCopyWithImpl(_$ServerShowsEmailsImpl _value,
      $Res Function(_$ServerShowsEmailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? emails = null,
  }) {
    return _then(_$ServerShowsEmailsImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      emails: null == emails
          ? _value._emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<EmailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerShowsEmailsImpl
    with DiagnosticableTreeMixin
    implements _ServerShowsEmails {
  const _$ServerShowsEmailsImpl(
      {required this.eventType, required final List<EmailModel> emails})
      : _emails = emails;

  factory _$ServerShowsEmailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerShowsEmailsImplFromJson(json);

  @override
  final String eventType;
  final List<EmailModel> _emails;
  @override
  List<EmailModel> get emails {
    if (_emails is EqualUnmodifiableListView) return _emails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emails);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerShowsEmails(eventType: $eventType, emails: $emails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerShowsEmails'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('emails', emails));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerShowsEmailsImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(other._emails, _emails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, eventType, const DeepCollectionEquality().hash(_emails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerShowsEmailsImplCopyWith<_$ServerShowsEmailsImpl> get copyWith =>
      __$$ServerShowsEmailsImplCopyWithImpl<_$ServerShowsEmailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerShowsEmailsImplToJson(
      this,
    );
  }
}

abstract class _ServerShowsEmails implements ServerShowsEmails {
  const factory _ServerShowsEmails(
      {required final String eventType,
      required final List<EmailModel> emails}) = _$ServerShowsEmailsImpl;

  factory _ServerShowsEmails.fromJson(Map<String, dynamic> json) =
      _$ServerShowsEmailsImpl.fromJson;

  @override
  String get eventType;
  @override
  List<EmailModel> get emails;
  @override
  @JsonKey(ignore: true)
  _$$ServerShowsEmailsImplCopyWith<_$ServerShowsEmailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerCreatesEmail _$ServerCreatesEmailFromJson(Map<String, dynamic> json) {
  return _ServerCreatesEmail.fromJson(json);
}

/// @nodoc
mixin _$ServerCreatesEmail {
  String get eventType => throw _privateConstructorUsedError;
  EmailModel get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerCreatesEmailCopyWith<ServerCreatesEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerCreatesEmailCopyWith<$Res> {
  factory $ServerCreatesEmailCopyWith(
          ServerCreatesEmail value, $Res Function(ServerCreatesEmail) then) =
      _$ServerCreatesEmailCopyWithImpl<$Res, ServerCreatesEmail>;
  @useResult
  $Res call({String eventType, EmailModel email});

  $EmailModelCopyWith<$Res> get email;
}

/// @nodoc
class _$ServerCreatesEmailCopyWithImpl<$Res, $Val extends ServerCreatesEmail>
    implements $ServerCreatesEmailCopyWith<$Res> {
  _$ServerCreatesEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmailModelCopyWith<$Res> get email {
    return $EmailModelCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServerCreatesEmailImplCopyWith<$Res>
    implements $ServerCreatesEmailCopyWith<$Res> {
  factory _$$ServerCreatesEmailImplCopyWith(_$ServerCreatesEmailImpl value,
          $Res Function(_$ServerCreatesEmailImpl) then) =
      __$$ServerCreatesEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, EmailModel email});

  @override
  $EmailModelCopyWith<$Res> get email;
}

/// @nodoc
class __$$ServerCreatesEmailImplCopyWithImpl<$Res>
    extends _$ServerCreatesEmailCopyWithImpl<$Res, _$ServerCreatesEmailImpl>
    implements _$$ServerCreatesEmailImplCopyWith<$Res> {
  __$$ServerCreatesEmailImplCopyWithImpl(_$ServerCreatesEmailImpl _value,
      $Res Function(_$ServerCreatesEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? email = null,
  }) {
    return _then(_$ServerCreatesEmailImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerCreatesEmailImpl
    with DiagnosticableTreeMixin
    implements _ServerCreatesEmail {
  const _$ServerCreatesEmailImpl(
      {required this.eventType, required this.email});

  factory _$ServerCreatesEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerCreatesEmailImplFromJson(json);

  @override
  final String eventType;
  @override
  final EmailModel email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerCreatesEmail(eventType: $eventType, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerCreatesEmail'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerCreatesEmailImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerCreatesEmailImplCopyWith<_$ServerCreatesEmailImpl> get copyWith =>
      __$$ServerCreatesEmailImplCopyWithImpl<_$ServerCreatesEmailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerCreatesEmailImplToJson(
      this,
    );
  }
}

abstract class _ServerCreatesEmail implements ServerCreatesEmail {
  const factory _ServerCreatesEmail(
      {required final String eventType,
      required final EmailModel email}) = _$ServerCreatesEmailImpl;

  factory _ServerCreatesEmail.fromJson(Map<String, dynamic> json) =
      _$ServerCreatesEmailImpl.fromJson;

  @override
  String get eventType;
  @override
  EmailModel get email;
  @override
  @JsonKey(ignore: true)
  _$$ServerCreatesEmailImplCopyWith<_$ServerCreatesEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerDeletesEmail _$ServerDeletesEmailFromJson(Map<String, dynamic> json) {
  return _ServerDeletesEmail.fromJson(json);
}

/// @nodoc
mixin _$ServerDeletesEmail {
  String get eventType => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  int get emailId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerDeletesEmailCopyWith<ServerDeletesEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerDeletesEmailCopyWith<$Res> {
  factory $ServerDeletesEmailCopyWith(
          ServerDeletesEmail value, $Res Function(ServerDeletesEmail) then) =
      _$ServerDeletesEmailCopyWithImpl<$Res, ServerDeletesEmail>;
  @useResult
  $Res call({String eventType, bool success, int emailId});
}

/// @nodoc
class _$ServerDeletesEmailCopyWithImpl<$Res, $Val extends ServerDeletesEmail>
    implements $ServerDeletesEmailCopyWith<$Res> {
  _$ServerDeletesEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? success = null,
    Object? emailId = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerDeletesEmailImplCopyWith<$Res>
    implements $ServerDeletesEmailCopyWith<$Res> {
  factory _$$ServerDeletesEmailImplCopyWith(_$ServerDeletesEmailImpl value,
          $Res Function(_$ServerDeletesEmailImpl) then) =
      __$$ServerDeletesEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, bool success, int emailId});
}

/// @nodoc
class __$$ServerDeletesEmailImplCopyWithImpl<$Res>
    extends _$ServerDeletesEmailCopyWithImpl<$Res, _$ServerDeletesEmailImpl>
    implements _$$ServerDeletesEmailImplCopyWith<$Res> {
  __$$ServerDeletesEmailImplCopyWithImpl(_$ServerDeletesEmailImpl _value,
      $Res Function(_$ServerDeletesEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? success = null,
    Object? emailId = null,
  }) {
    return _then(_$ServerDeletesEmailImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerDeletesEmailImpl
    with DiagnosticableTreeMixin
    implements _ServerDeletesEmail {
  const _$ServerDeletesEmailImpl(
      {required this.eventType, required this.success, required this.emailId});

  factory _$ServerDeletesEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerDeletesEmailImplFromJson(json);

  @override
  final String eventType;
  @override
  final bool success;
  @override
  final int emailId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerDeletesEmail(eventType: $eventType, success: $success, emailId: $emailId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerDeletesEmail'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('emailId', emailId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerDeletesEmailImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.emailId, emailId) || other.emailId == emailId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, success, emailId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerDeletesEmailImplCopyWith<_$ServerDeletesEmailImpl> get copyWith =>
      __$$ServerDeletesEmailImplCopyWithImpl<_$ServerDeletesEmailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerDeletesEmailImplToJson(
      this,
    );
  }
}

abstract class _ServerDeletesEmail implements ServerDeletesEmail {
  const factory _ServerDeletesEmail(
      {required final String eventType,
      required final bool success,
      required final int emailId}) = _$ServerDeletesEmailImpl;

  factory _ServerDeletesEmail.fromJson(Map<String, dynamic> json) =
      _$ServerDeletesEmailImpl.fromJson;

  @override
  String get eventType;
  @override
  bool get success;
  @override
  int get emailId;
  @override
  @JsonKey(ignore: true)
  _$$ServerDeletesEmailImplCopyWith<_$ServerDeletesEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerShowsHistory _$ServerShowsHistoryFromJson(Map<String, dynamic> json) {
  return _ServerShowsHistory.fromJson(json);
}

/// @nodoc
mixin _$ServerShowsHistory {
  String get eventType => throw _privateConstructorUsedError;
  List<HistoryModel> get historyList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerShowsHistoryCopyWith<ServerShowsHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerShowsHistoryCopyWith<$Res> {
  factory $ServerShowsHistoryCopyWith(
          ServerShowsHistory value, $Res Function(ServerShowsHistory) then) =
      _$ServerShowsHistoryCopyWithImpl<$Res, ServerShowsHistory>;
  @useResult
  $Res call({String eventType, List<HistoryModel> historyList});
}

/// @nodoc
class _$ServerShowsHistoryCopyWithImpl<$Res, $Val extends ServerShowsHistory>
    implements $ServerShowsHistoryCopyWith<$Res> {
  _$ServerShowsHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? historyList = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      historyList: null == historyList
          ? _value.historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerShowsHistoryImplCopyWith<$Res>
    implements $ServerShowsHistoryCopyWith<$Res> {
  factory _$$ServerShowsHistoryImplCopyWith(_$ServerShowsHistoryImpl value,
          $Res Function(_$ServerShowsHistoryImpl) then) =
      __$$ServerShowsHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, List<HistoryModel> historyList});
}

/// @nodoc
class __$$ServerShowsHistoryImplCopyWithImpl<$Res>
    extends _$ServerShowsHistoryCopyWithImpl<$Res, _$ServerShowsHistoryImpl>
    implements _$$ServerShowsHistoryImplCopyWith<$Res> {
  __$$ServerShowsHistoryImplCopyWithImpl(_$ServerShowsHistoryImpl _value,
      $Res Function(_$ServerShowsHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? historyList = null,
  }) {
    return _then(_$ServerShowsHistoryImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      historyList: null == historyList
          ? _value._historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerShowsHistoryImpl
    with DiagnosticableTreeMixin
    implements _ServerShowsHistory {
  const _$ServerShowsHistoryImpl(
      {required this.eventType, required final List<HistoryModel> historyList})
      : _historyList = historyList;

  factory _$ServerShowsHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerShowsHistoryImplFromJson(json);

  @override
  final String eventType;
  final List<HistoryModel> _historyList;
  @override
  List<HistoryModel> get historyList {
    if (_historyList is EqualUnmodifiableListView) return _historyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerShowsHistory(eventType: $eventType, historyList: $historyList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerShowsHistory'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('historyList', historyList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerShowsHistoryImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality()
                .equals(other._historyList, _historyList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType,
      const DeepCollectionEquality().hash(_historyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerShowsHistoryImplCopyWith<_$ServerShowsHistoryImpl> get copyWith =>
      __$$ServerShowsHistoryImplCopyWithImpl<_$ServerShowsHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerShowsHistoryImplToJson(
      this,
    );
  }
}

abstract class _ServerShowsHistory implements ServerShowsHistory {
  const factory _ServerShowsHistory(
          {required final String eventType,
          required final List<HistoryModel> historyList}) =
      _$ServerShowsHistoryImpl;

  factory _ServerShowsHistory.fromJson(Map<String, dynamic> json) =
      _$ServerShowsHistoryImpl.fromJson;

  @override
  String get eventType;
  @override
  List<HistoryModel> get historyList;
  @override
  @JsonKey(ignore: true)
  _$$ServerShowsHistoryImplCopyWith<_$ServerShowsHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerShowsUnits _$ServerShowsUnitsFromJson(Map<String, dynamic> json) {
  return _ServerShowsUnits.fromJson(json);
}

/// @nodoc
mixin _$ServerShowsUnits {
  String get eventType => throw _privateConstructorUsedError;
  List<UnitModel> get unitList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerShowsUnitsCopyWith<ServerShowsUnits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerShowsUnitsCopyWith<$Res> {
  factory $ServerShowsUnitsCopyWith(
          ServerShowsUnits value, $Res Function(ServerShowsUnits) then) =
      _$ServerShowsUnitsCopyWithImpl<$Res, ServerShowsUnits>;
  @useResult
  $Res call({String eventType, List<UnitModel> unitList});
}

/// @nodoc
class _$ServerShowsUnitsCopyWithImpl<$Res, $Val extends ServerShowsUnits>
    implements $ServerShowsUnitsCopyWith<$Res> {
  _$ServerShowsUnitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? unitList = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      unitList: null == unitList
          ? _value.unitList
          : unitList // ignore: cast_nullable_to_non_nullable
              as List<UnitModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerShowsUnitsImplCopyWith<$Res>
    implements $ServerShowsUnitsCopyWith<$Res> {
  factory _$$ServerShowsUnitsImplCopyWith(_$ServerShowsUnitsImpl value,
          $Res Function(_$ServerShowsUnitsImpl) then) =
      __$$ServerShowsUnitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, List<UnitModel> unitList});
}

/// @nodoc
class __$$ServerShowsUnitsImplCopyWithImpl<$Res>
    extends _$ServerShowsUnitsCopyWithImpl<$Res, _$ServerShowsUnitsImpl>
    implements _$$ServerShowsUnitsImplCopyWith<$Res> {
  __$$ServerShowsUnitsImplCopyWithImpl(_$ServerShowsUnitsImpl _value,
      $Res Function(_$ServerShowsUnitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? unitList = null,
  }) {
    return _then(_$ServerShowsUnitsImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      unitList: null == unitList
          ? _value._unitList
          : unitList // ignore: cast_nullable_to_non_nullable
              as List<UnitModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerShowsUnitsImpl
    with DiagnosticableTreeMixin
    implements _ServerShowsUnits {
  const _$ServerShowsUnitsImpl(
      {required this.eventType, required final List<UnitModel> unitList})
      : _unitList = unitList;

  factory _$ServerShowsUnitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerShowsUnitsImplFromJson(json);

  @override
  final String eventType;
  final List<UnitModel> _unitList;
  @override
  List<UnitModel> get unitList {
    if (_unitList is EqualUnmodifiableListView) return _unitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unitList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerShowsUnits(eventType: $eventType, unitList: $unitList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerShowsUnits'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('unitList', unitList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerShowsUnitsImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(other._unitList, _unitList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, eventType, const DeepCollectionEquality().hash(_unitList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerShowsUnitsImplCopyWith<_$ServerShowsUnitsImpl> get copyWith =>
      __$$ServerShowsUnitsImplCopyWithImpl<_$ServerShowsUnitsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerShowsUnitsImplToJson(
      this,
    );
  }
}

abstract class _ServerShowsUnits implements ServerShowsUnits {
  const factory _ServerShowsUnits(
      {required final String eventType,
      required final List<UnitModel> unitList}) = _$ServerShowsUnitsImpl;

  factory _ServerShowsUnits.fromJson(Map<String, dynamic> json) =
      _$ServerShowsUnitsImpl.fromJson;

  @override
  String get eventType;
  @override
  List<UnitModel> get unitList;
  @override
  @JsonKey(ignore: true)
  _$$ServerShowsUnitsImplCopyWith<_$ServerShowsUnitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerAuthenticatesUser _$ServerAuthenticatesUserFromJson(
    Map<String, dynamic> json) {
  return _ServerAuthenticatesUser.fromJson(json);
}

/// @nodoc
mixin _$ServerAuthenticatesUser {
  String get eventType => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  String get jwt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerAuthenticatesUserCopyWith<ServerAuthenticatesUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerAuthenticatesUserCopyWith<$Res> {
  factory $ServerAuthenticatesUserCopyWith(ServerAuthenticatesUser value,
          $Res Function(ServerAuthenticatesUser) then) =
      _$ServerAuthenticatesUserCopyWithImpl<$Res, ServerAuthenticatesUser>;
  @useResult
  $Res call({String eventType, UserModel user, String jwt});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ServerAuthenticatesUserCopyWithImpl<$Res,
        $Val extends ServerAuthenticatesUser>
    implements $ServerAuthenticatesUserCopyWith<$Res> {
  _$ServerAuthenticatesUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? user = null,
    Object? jwt = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServerAuthenticatesUserImplCopyWith<$Res>
    implements $ServerAuthenticatesUserCopyWith<$Res> {
  factory _$$ServerAuthenticatesUserImplCopyWith(
          _$ServerAuthenticatesUserImpl value,
          $Res Function(_$ServerAuthenticatesUserImpl) then) =
      __$$ServerAuthenticatesUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, UserModel user, String jwt});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$ServerAuthenticatesUserImplCopyWithImpl<$Res>
    extends _$ServerAuthenticatesUserCopyWithImpl<$Res,
        _$ServerAuthenticatesUserImpl>
    implements _$$ServerAuthenticatesUserImplCopyWith<$Res> {
  __$$ServerAuthenticatesUserImplCopyWithImpl(
      _$ServerAuthenticatesUserImpl _value,
      $Res Function(_$ServerAuthenticatesUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? user = null,
    Object? jwt = null,
  }) {
    return _then(_$ServerAuthenticatesUserImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerAuthenticatesUserImpl
    with DiagnosticableTreeMixin
    implements _ServerAuthenticatesUser {
  const _$ServerAuthenticatesUserImpl(
      {required this.eventType, required this.user, required this.jwt});

  factory _$ServerAuthenticatesUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerAuthenticatesUserImplFromJson(json);

  @override
  final String eventType;
  @override
  final UserModel user;
  @override
  final String jwt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerAuthenticatesUser(eventType: $eventType, user: $user, jwt: $jwt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerAuthenticatesUser'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('jwt', jwt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerAuthenticatesUserImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.jwt, jwt) || other.jwt == jwt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, user, jwt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerAuthenticatesUserImplCopyWith<_$ServerAuthenticatesUserImpl>
      get copyWith => __$$ServerAuthenticatesUserImplCopyWithImpl<
          _$ServerAuthenticatesUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerAuthenticatesUserImplToJson(
      this,
    );
  }
}

abstract class _ServerAuthenticatesUser implements ServerAuthenticatesUser {
  const factory _ServerAuthenticatesUser(
      {required final String eventType,
      required final UserModel user,
      required final String jwt}) = _$ServerAuthenticatesUserImpl;

  factory _ServerAuthenticatesUser.fromJson(Map<String, dynamic> json) =
      _$ServerAuthenticatesUserImpl.fromJson;

  @override
  String get eventType;
  @override
  UserModel get user;
  @override
  String get jwt;
  @override
  @JsonKey(ignore: true)
  _$$ServerAuthenticatesUserImplCopyWith<_$ServerAuthenticatesUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServerDeAuthenticatesUser _$ServerDeAuthenticatesUserFromJson(
    Map<String, dynamic> json) {
  return _ServerDeAuthenticatesUser.fromJson(json);
}

/// @nodoc
mixin _$ServerDeAuthenticatesUser {
  String get eventType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerDeAuthenticatesUserCopyWith<ServerDeAuthenticatesUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerDeAuthenticatesUserCopyWith<$Res> {
  factory $ServerDeAuthenticatesUserCopyWith(ServerDeAuthenticatesUser value,
          $Res Function(ServerDeAuthenticatesUser) then) =
      _$ServerDeAuthenticatesUserCopyWithImpl<$Res, ServerDeAuthenticatesUser>;
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class _$ServerDeAuthenticatesUserCopyWithImpl<$Res,
        $Val extends ServerDeAuthenticatesUser>
    implements $ServerDeAuthenticatesUserCopyWith<$Res> {
  _$ServerDeAuthenticatesUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerDeAuthenticatesUserImplCopyWith<$Res>
    implements $ServerDeAuthenticatesUserCopyWith<$Res> {
  factory _$$ServerDeAuthenticatesUserImplCopyWith(
          _$ServerDeAuthenticatesUserImpl value,
          $Res Function(_$ServerDeAuthenticatesUserImpl) then) =
      __$$ServerDeAuthenticatesUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$ServerDeAuthenticatesUserImplCopyWithImpl<$Res>
    extends _$ServerDeAuthenticatesUserCopyWithImpl<$Res,
        _$ServerDeAuthenticatesUserImpl>
    implements _$$ServerDeAuthenticatesUserImplCopyWith<$Res> {
  __$$ServerDeAuthenticatesUserImplCopyWithImpl(
      _$ServerDeAuthenticatesUserImpl _value,
      $Res Function(_$ServerDeAuthenticatesUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$ServerDeAuthenticatesUserImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerDeAuthenticatesUserImpl
    with DiagnosticableTreeMixin
    implements _ServerDeAuthenticatesUser {
  const _$ServerDeAuthenticatesUserImpl({required this.eventType});

  factory _$ServerDeAuthenticatesUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerDeAuthenticatesUserImplFromJson(json);

  @override
  final String eventType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerDeAuthenticatesUser(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerDeAuthenticatesUser'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerDeAuthenticatesUserImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerDeAuthenticatesUserImplCopyWith<_$ServerDeAuthenticatesUserImpl>
      get copyWith => __$$ServerDeAuthenticatesUserImplCopyWithImpl<
          _$ServerDeAuthenticatesUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerDeAuthenticatesUserImplToJson(
      this,
    );
  }
}

abstract class _ServerDeAuthenticatesUser implements ServerDeAuthenticatesUser {
  const factory _ServerDeAuthenticatesUser({required final String eventType}) =
      _$ServerDeAuthenticatesUserImpl;

  factory _ServerDeAuthenticatesUser.fromJson(Map<String, dynamic> json) =
      _$ServerDeAuthenticatesUserImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$ServerDeAuthenticatesUserImplCopyWith<_$ServerDeAuthenticatesUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServerClosesWindowDoor _$ServerClosesWindowDoorFromJson(
    Map<String, dynamic> json) {
  return _ServerClosesWindowDoor.fromJson(json);
}

/// @nodoc
mixin _$ServerClosesWindowDoor {
  HistoryModel get history => throw _privateConstructorUsedError;
  UnitModel get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerClosesWindowDoorCopyWith<ServerClosesWindowDoor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerClosesWindowDoorCopyWith<$Res> {
  factory $ServerClosesWindowDoorCopyWith(ServerClosesWindowDoor value,
          $Res Function(ServerClosesWindowDoor) then) =
      _$ServerClosesWindowDoorCopyWithImpl<$Res, ServerClosesWindowDoor>;
  @useResult
  $Res call({HistoryModel history, UnitModel unit});

  $HistoryModelCopyWith<$Res> get history;
  $UnitModelCopyWith<$Res> get unit;
}

/// @nodoc
class _$ServerClosesWindowDoorCopyWithImpl<$Res,
        $Val extends ServerClosesWindowDoor>
    implements $ServerClosesWindowDoorCopyWith<$Res> {
  _$ServerClosesWindowDoorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HistoryModelCopyWith<$Res> get history {
    return $HistoryModelCopyWith<$Res>(_value.history, (value) {
      return _then(_value.copyWith(history: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitModelCopyWith<$Res> get unit {
    return $UnitModelCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServerClosesWindowDoorImplCopyWith<$Res>
    implements $ServerClosesWindowDoorCopyWith<$Res> {
  factory _$$ServerClosesWindowDoorImplCopyWith(
          _$ServerClosesWindowDoorImpl value,
          $Res Function(_$ServerClosesWindowDoorImpl) then) =
      __$$ServerClosesWindowDoorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryModel history, UnitModel unit});

  @override
  $HistoryModelCopyWith<$Res> get history;
  @override
  $UnitModelCopyWith<$Res> get unit;
}

/// @nodoc
class __$$ServerClosesWindowDoorImplCopyWithImpl<$Res>
    extends _$ServerClosesWindowDoorCopyWithImpl<$Res,
        _$ServerClosesWindowDoorImpl>
    implements _$$ServerClosesWindowDoorImplCopyWith<$Res> {
  __$$ServerClosesWindowDoorImplCopyWithImpl(
      _$ServerClosesWindowDoorImpl _value,
      $Res Function(_$ServerClosesWindowDoorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? unit = null,
  }) {
    return _then(_$ServerClosesWindowDoorImpl(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerClosesWindowDoorImpl
    with DiagnosticableTreeMixin
    implements _ServerClosesWindowDoor {
  const _$ServerClosesWindowDoorImpl(
      {required this.history, required this.unit});

  factory _$ServerClosesWindowDoorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerClosesWindowDoorImplFromJson(json);

  @override
  final HistoryModel history;
  @override
  final UnitModel unit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerClosesWindowDoor(history: $history, unit: $unit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerClosesWindowDoor'))
      ..add(DiagnosticsProperty('history', history))
      ..add(DiagnosticsProperty('unit', unit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerClosesWindowDoorImpl &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, history, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerClosesWindowDoorImplCopyWith<_$ServerClosesWindowDoorImpl>
      get copyWith => __$$ServerClosesWindowDoorImplCopyWithImpl<
          _$ServerClosesWindowDoorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerClosesWindowDoorImplToJson(
      this,
    );
  }
}

abstract class _ServerClosesWindowDoor implements ServerClosesWindowDoor {
  const factory _ServerClosesWindowDoor(
      {required final HistoryModel history,
      required final UnitModel unit}) = _$ServerClosesWindowDoorImpl;

  factory _ServerClosesWindowDoor.fromJson(Map<String, dynamic> json) =
      _$ServerClosesWindowDoorImpl.fromJson;

  @override
  HistoryModel get history;
  @override
  UnitModel get unit;
  @override
  @JsonKey(ignore: true)
  _$$ServerClosesWindowDoorImplCopyWith<_$ServerClosesWindowDoorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServerOpensWindowDoor _$ServerOpensWindowDoorFromJson(
    Map<String, dynamic> json) {
  return _ServerOpensWindowDoor.fromJson(json);
}

/// @nodoc
mixin _$ServerOpensWindowDoor {
  HistoryModel get history => throw _privateConstructorUsedError;
  UnitModel get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerOpensWindowDoorCopyWith<ServerOpensWindowDoor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerOpensWindowDoorCopyWith<$Res> {
  factory $ServerOpensWindowDoorCopyWith(ServerOpensWindowDoor value,
          $Res Function(ServerOpensWindowDoor) then) =
      _$ServerOpensWindowDoorCopyWithImpl<$Res, ServerOpensWindowDoor>;
  @useResult
  $Res call({HistoryModel history, UnitModel unit});

  $HistoryModelCopyWith<$Res> get history;
  $UnitModelCopyWith<$Res> get unit;
}

/// @nodoc
class _$ServerOpensWindowDoorCopyWithImpl<$Res,
        $Val extends ServerOpensWindowDoor>
    implements $ServerOpensWindowDoorCopyWith<$Res> {
  _$ServerOpensWindowDoorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HistoryModelCopyWith<$Res> get history {
    return $HistoryModelCopyWith<$Res>(_value.history, (value) {
      return _then(_value.copyWith(history: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitModelCopyWith<$Res> get unit {
    return $UnitModelCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServerOpensWindowDoorImplCopyWith<$Res>
    implements $ServerOpensWindowDoorCopyWith<$Res> {
  factory _$$ServerOpensWindowDoorImplCopyWith(
          _$ServerOpensWindowDoorImpl value,
          $Res Function(_$ServerOpensWindowDoorImpl) then) =
      __$$ServerOpensWindowDoorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryModel history, UnitModel unit});

  @override
  $HistoryModelCopyWith<$Res> get history;
  @override
  $UnitModelCopyWith<$Res> get unit;
}

/// @nodoc
class __$$ServerOpensWindowDoorImplCopyWithImpl<$Res>
    extends _$ServerOpensWindowDoorCopyWithImpl<$Res,
        _$ServerOpensWindowDoorImpl>
    implements _$$ServerOpensWindowDoorImplCopyWith<$Res> {
  __$$ServerOpensWindowDoorImplCopyWithImpl(_$ServerOpensWindowDoorImpl _value,
      $Res Function(_$ServerOpensWindowDoorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? unit = null,
  }) {
    return _then(_$ServerOpensWindowDoorImpl(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerOpensWindowDoorImpl
    with DiagnosticableTreeMixin
    implements _ServerOpensWindowDoor {
  const _$ServerOpensWindowDoorImpl(
      {required this.history, required this.unit});

  factory _$ServerOpensWindowDoorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerOpensWindowDoorImplFromJson(json);

  @override
  final HistoryModel history;
  @override
  final UnitModel unit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerOpensWindowDoor(history: $history, unit: $unit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerOpensWindowDoor'))
      ..add(DiagnosticsProperty('history', history))
      ..add(DiagnosticsProperty('unit', unit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerOpensWindowDoorImpl &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, history, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerOpensWindowDoorImplCopyWith<_$ServerOpensWindowDoorImpl>
      get copyWith => __$$ServerOpensWindowDoorImplCopyWithImpl<
          _$ServerOpensWindowDoorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerOpensWindowDoorImplToJson(
      this,
    );
  }
}

abstract class _ServerOpensWindowDoor implements ServerOpensWindowDoor {
  const factory _ServerOpensWindowDoor(
      {required final HistoryModel history,
      required final UnitModel unit}) = _$ServerOpensWindowDoorImpl;

  factory _ServerOpensWindowDoor.fromJson(Map<String, dynamic> json) =
      _$ServerOpensWindowDoorImpl.fromJson;

  @override
  HistoryModel get history;
  @override
  UnitModel get unit;
  @override
  @JsonKey(ignore: true)
  _$$ServerOpensWindowDoorImplCopyWith<_$ServerOpensWindowDoorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
