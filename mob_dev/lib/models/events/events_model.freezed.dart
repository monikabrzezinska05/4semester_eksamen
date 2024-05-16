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

ClientClosesWindowDoor _$ClientClosesWindowDoorFromJson(
    Map<String, dynamic> json) {
  return _ClientClosesWindowDoor.fromJson(json);
}

/// @nodoc
mixin _$ClientClosesWindowDoor {
  String get eventType => throw _privateConstructorUsedError;
  HistoryModel get historyModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientClosesWindowDoorCopyWith<ClientClosesWindowDoor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientClosesWindowDoorCopyWith<$Res> {
  factory $ClientClosesWindowDoorCopyWith(ClientClosesWindowDoor value,
          $Res Function(ClientClosesWindowDoor) then) =
      _$ClientClosesWindowDoorCopyWithImpl<$Res, ClientClosesWindowDoor>;
  @useResult
  $Res call({String eventType, HistoryModel historyModel});

  $HistoryModelCopyWith<$Res> get historyModel;
}

/// @nodoc
class _$ClientClosesWindowDoorCopyWithImpl<$Res,
        $Val extends ClientClosesWindowDoor>
    implements $ClientClosesWindowDoorCopyWith<$Res> {
  _$ClientClosesWindowDoorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? historyModel = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      historyModel: null == historyModel
          ? _value.historyModel
          : historyModel // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HistoryModelCopyWith<$Res> get historyModel {
    return $HistoryModelCopyWith<$Res>(_value.historyModel, (value) {
      return _then(_value.copyWith(historyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientClosesWindowDoorImplCopyWith<$Res>
    implements $ClientClosesWindowDoorCopyWith<$Res> {
  factory _$$ClientClosesWindowDoorImplCopyWith(
          _$ClientClosesWindowDoorImpl value,
          $Res Function(_$ClientClosesWindowDoorImpl) then) =
      __$$ClientClosesWindowDoorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, HistoryModel historyModel});

  @override
  $HistoryModelCopyWith<$Res> get historyModel;
}

/// @nodoc
class __$$ClientClosesWindowDoorImplCopyWithImpl<$Res>
    extends _$ClientClosesWindowDoorCopyWithImpl<$Res,
        _$ClientClosesWindowDoorImpl>
    implements _$$ClientClosesWindowDoorImplCopyWith<$Res> {
  __$$ClientClosesWindowDoorImplCopyWithImpl(
      _$ClientClosesWindowDoorImpl _value,
      $Res Function(_$ClientClosesWindowDoorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? historyModel = null,
  }) {
    return _then(_$ClientClosesWindowDoorImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      historyModel: null == historyModel
          ? _value.historyModel
          : historyModel // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientClosesWindowDoorImpl
    with DiagnosticableTreeMixin
    implements _ClientClosesWindowDoor {
  const _$ClientClosesWindowDoorImpl(
      {required this.eventType, required this.historyModel});

  factory _$ClientClosesWindowDoorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientClosesWindowDoorImplFromJson(json);

  @override
  final String eventType;
  @override
  final HistoryModel historyModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientClosesWindowDoor(eventType: $eventType, historyModel: $historyModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientClosesWindowDoor'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('historyModel', historyModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientClosesWindowDoorImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.historyModel, historyModel) ||
                other.historyModel == historyModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, historyModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientClosesWindowDoorImplCopyWith<_$ClientClosesWindowDoorImpl>
      get copyWith => __$$ClientClosesWindowDoorImplCopyWithImpl<
          _$ClientClosesWindowDoorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientClosesWindowDoorImplToJson(
      this,
    );
  }
}

abstract class _ClientClosesWindowDoor implements ClientClosesWindowDoor {
  const factory _ClientClosesWindowDoor(
      {required final String eventType,
      required final HistoryModel historyModel}) = _$ClientClosesWindowDoorImpl;

  factory _ClientClosesWindowDoor.fromJson(Map<String, dynamic> json) =
      _$ClientClosesWindowDoorImpl.fromJson;

  @override
  String get eventType;
  @override
  HistoryModel get historyModel;
  @override
  @JsonKey(ignore: true)
  _$$ClientClosesWindowDoorImplCopyWith<_$ClientClosesWindowDoorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClientOpensWindowDoor _$ClientOpensWindowDoorFromJson(
    Map<String, dynamic> json) {
  return _ClientOpensWindowDoor.fromJson(json);
}

/// @nodoc
mixin _$ClientOpensWindowDoor {
  String get eventType => throw _privateConstructorUsedError;
  HistoryModel get historyModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientOpensWindowDoorCopyWith<ClientOpensWindowDoor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientOpensWindowDoorCopyWith<$Res> {
  factory $ClientOpensWindowDoorCopyWith(ClientOpensWindowDoor value,
          $Res Function(ClientOpensWindowDoor) then) =
      _$ClientOpensWindowDoorCopyWithImpl<$Res, ClientOpensWindowDoor>;
  @useResult
  $Res call({String eventType, HistoryModel historyModel});

  $HistoryModelCopyWith<$Res> get historyModel;
}

/// @nodoc
class _$ClientOpensWindowDoorCopyWithImpl<$Res,
        $Val extends ClientOpensWindowDoor>
    implements $ClientOpensWindowDoorCopyWith<$Res> {
  _$ClientOpensWindowDoorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? historyModel = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      historyModel: null == historyModel
          ? _value.historyModel
          : historyModel // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HistoryModelCopyWith<$Res> get historyModel {
    return $HistoryModelCopyWith<$Res>(_value.historyModel, (value) {
      return _then(_value.copyWith(historyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientOpensWindowDoorImplCopyWith<$Res>
    implements $ClientOpensWindowDoorCopyWith<$Res> {
  factory _$$ClientOpensWindowDoorImplCopyWith(
          _$ClientOpensWindowDoorImpl value,
          $Res Function(_$ClientOpensWindowDoorImpl) then) =
      __$$ClientOpensWindowDoorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, HistoryModel historyModel});

  @override
  $HistoryModelCopyWith<$Res> get historyModel;
}

/// @nodoc
class __$$ClientOpensWindowDoorImplCopyWithImpl<$Res>
    extends _$ClientOpensWindowDoorCopyWithImpl<$Res,
        _$ClientOpensWindowDoorImpl>
    implements _$$ClientOpensWindowDoorImplCopyWith<$Res> {
  __$$ClientOpensWindowDoorImplCopyWithImpl(_$ClientOpensWindowDoorImpl _value,
      $Res Function(_$ClientOpensWindowDoorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? historyModel = null,
  }) {
    return _then(_$ClientOpensWindowDoorImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      historyModel: null == historyModel
          ? _value.historyModel
          : historyModel // ignore: cast_nullable_to_non_nullable
              as HistoryModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientOpensWindowDoorImpl
    with DiagnosticableTreeMixin
    implements _ClientOpensWindowDoor {
  const _$ClientOpensWindowDoorImpl(
      {required this.eventType, required this.historyModel});

  factory _$ClientOpensWindowDoorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientOpensWindowDoorImplFromJson(json);

  @override
  final String eventType;
  @override
  final HistoryModel historyModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientOpensWindowDoor(eventType: $eventType, historyModel: $historyModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientOpensWindowDoor'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('historyModel', historyModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientOpensWindowDoorImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.historyModel, historyModel) ||
                other.historyModel == historyModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, historyModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientOpensWindowDoorImplCopyWith<_$ClientOpensWindowDoorImpl>
      get copyWith => __$$ClientOpensWindowDoorImplCopyWithImpl<
          _$ClientOpensWindowDoorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientOpensWindowDoorImplToJson(
      this,
    );
  }
}

abstract class _ClientOpensWindowDoor implements ClientOpensWindowDoor {
  const factory _ClientOpensWindowDoor(
      {required final String eventType,
      required final HistoryModel historyModel}) = _$ClientOpensWindowDoorImpl;

  factory _ClientOpensWindowDoor.fromJson(Map<String, dynamic> json) =
      _$ClientOpensWindowDoorImpl.fromJson;

  @override
  String get eventType;
  @override
  HistoryModel get historyModel;
  @override
  @JsonKey(ignore: true)
  _$$ClientOpensWindowDoorImplCopyWith<_$ClientOpensWindowDoorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

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
