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
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

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
  $Res call({String eventType, String email, String password});
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
    Object? email = null,
    Object? password = null,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $Res call({String eventType, String email, String password});
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
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$ClientWantsToLoginImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientWantsToLoginImpl
    with DiagnosticableTreeMixin
    implements _ClientWantsToLogin {
  const _$ClientWantsToLoginImpl(
      {required this.eventType, required this.email, required this.password});

  factory _$ClientWantsToLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientWantsToLoginImplFromJson(json);

  @override
  final String eventType;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientWantsToLogin(eventType: $eventType, email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientWantsToLogin'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientWantsToLoginImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, email, password);

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
      required final String email,
      required final String password}) = _$ClientWantsToLoginImpl;

  factory _ClientWantsToLogin.fromJson(Map<String, dynamic> json) =
      _$ClientWantsToLoginImpl.fromJson;

  @override
  String get eventType;
  @override
  String get email;
  @override
  String get password;
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

ServerShowsEmailList _$ServerShowsEmailListFromJson(Map<String, dynamic> json) {
  return _ServerShowsEmailList.fromJson(json);
}

/// @nodoc
mixin _$ServerShowsEmailList {
  String get eventType => throw _privateConstructorUsedError;
  List<EmailModel> get emails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerShowsEmailListCopyWith<ServerShowsEmailList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerShowsEmailListCopyWith<$Res> {
  factory $ServerShowsEmailListCopyWith(ServerShowsEmailList value,
          $Res Function(ServerShowsEmailList) then) =
      _$ServerShowsEmailListCopyWithImpl<$Res, ServerShowsEmailList>;
  @useResult
  $Res call({String eventType, List<EmailModel> emails});
}

/// @nodoc
class _$ServerShowsEmailListCopyWithImpl<$Res,
        $Val extends ServerShowsEmailList>
    implements $ServerShowsEmailListCopyWith<$Res> {
  _$ServerShowsEmailListCopyWithImpl(this._value, this._then);

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
abstract class _$$ServerShowsEmailListImplCopyWith<$Res>
    implements $ServerShowsEmailListCopyWith<$Res> {
  factory _$$ServerShowsEmailListImplCopyWith(_$ServerShowsEmailListImpl value,
          $Res Function(_$ServerShowsEmailListImpl) then) =
      __$$ServerShowsEmailListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, List<EmailModel> emails});
}

/// @nodoc
class __$$ServerShowsEmailListImplCopyWithImpl<$Res>
    extends _$ServerShowsEmailListCopyWithImpl<$Res, _$ServerShowsEmailListImpl>
    implements _$$ServerShowsEmailListImplCopyWith<$Res> {
  __$$ServerShowsEmailListImplCopyWithImpl(_$ServerShowsEmailListImpl _value,
      $Res Function(_$ServerShowsEmailListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? emails = null,
  }) {
    return _then(_$ServerShowsEmailListImpl(
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
class _$ServerShowsEmailListImpl
    with DiagnosticableTreeMixin
    implements _ServerShowsEmailList {
  const _$ServerShowsEmailListImpl(
      {required this.eventType, required final List<EmailModel> emails})
      : _emails = emails;

  factory _$ServerShowsEmailListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerShowsEmailListImplFromJson(json);

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
    return 'ServerShowsEmailList(eventType: $eventType, emails: $emails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerShowsEmailList'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('emails', emails));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerShowsEmailListImpl &&
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
  _$$ServerShowsEmailListImplCopyWith<_$ServerShowsEmailListImpl>
      get copyWith =>
          __$$ServerShowsEmailListImplCopyWithImpl<_$ServerShowsEmailListImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerShowsEmailListImplToJson(
      this,
    );
  }
}

abstract class _ServerShowsEmailList implements ServerShowsEmailList {
  const factory _ServerShowsEmailList(
      {required final String eventType,
      required final List<EmailModel> emails}) = _$ServerShowsEmailListImpl;

  factory _ServerShowsEmailList.fromJson(Map<String, dynamic> json) =
      _$ServerShowsEmailListImpl.fromJson;

  @override
  String get eventType;
  @override
  List<EmailModel> get emails;
  @override
  @JsonKey(ignore: true)
  _$$ServerShowsEmailListImplCopyWith<_$ServerShowsEmailListImpl>
      get copyWith => throw _privateConstructorUsedError;
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
