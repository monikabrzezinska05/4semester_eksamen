// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_element_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryElementModel _$HistoryElementModelFromJson(Map<String, dynamic> json) {
  return _HistoryElementModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryElementModel {
  int get historyId => throw _privateConstructorUsedError;
  UnitModel get unit => throw _privateConstructorUsedError;
  String get personName => throw _privateConstructorUsedError;
  EventType get eventType => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryElementModelCopyWith<HistoryElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryElementModelCopyWith<$Res> {
  factory $HistoryElementModelCopyWith(
          HistoryElementModel value, $Res Function(HistoryElementModel) then) =
      _$HistoryElementModelCopyWithImpl<$Res, HistoryElementModel>;
  @useResult
  $Res call(
      {int historyId,
      UnitModel unit,
      String personName,
      EventType eventType,
      DateTime date});

  $UnitModelCopyWith<$Res> get unit;
}

/// @nodoc
class _$HistoryElementModelCopyWithImpl<$Res, $Val extends HistoryElementModel>
    implements $HistoryElementModelCopyWith<$Res> {
  _$HistoryElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? unit = null,
    Object? personName = null,
    Object? eventType = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      historyId: null == historyId
          ? _value.historyId
          : historyId // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitModel,
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as EventType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
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
abstract class _$$HistoryElementModelImplCopyWith<$Res>
    implements $HistoryElementModelCopyWith<$Res> {
  factory _$$HistoryElementModelImplCopyWith(_$HistoryElementModelImpl value,
          $Res Function(_$HistoryElementModelImpl) then) =
      __$$HistoryElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int historyId,
      UnitModel unit,
      String personName,
      EventType eventType,
      DateTime date});

  @override
  $UnitModelCopyWith<$Res> get unit;
}

/// @nodoc
class __$$HistoryElementModelImplCopyWithImpl<$Res>
    extends _$HistoryElementModelCopyWithImpl<$Res, _$HistoryElementModelImpl>
    implements _$$HistoryElementModelImplCopyWith<$Res> {
  __$$HistoryElementModelImplCopyWithImpl(_$HistoryElementModelImpl _value,
      $Res Function(_$HistoryElementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? unit = null,
    Object? personName = null,
    Object? eventType = null,
    Object? date = null,
  }) {
    return _then(_$HistoryElementModelImpl(
      historyId: null == historyId
          ? _value.historyId
          : historyId // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitModel,
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as EventType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryElementModelImpl
    with DiagnosticableTreeMixin
    implements _HistoryElementModel {
  _$HistoryElementModelImpl(
      {required this.historyId,
      required this.unit,
      required this.personName,
      required this.eventType,
      required this.date});

  factory _$HistoryElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryElementModelImplFromJson(json);

  @override
  final int historyId;
  @override
  final UnitModel unit;
  @override
  final String personName;
  @override
  final EventType eventType;
  @override
  final DateTime date;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryElementModel(historyId: $historyId, unit: $unit, personName: $personName, eventType: $eventType, date: $date)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryElementModel'))
      ..add(DiagnosticsProperty('historyId', historyId))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('personName', personName))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('date', date));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryElementModelImpl &&
            (identical(other.historyId, historyId) ||
                other.historyId == historyId) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, historyId, unit, personName, eventType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryElementModelImplCopyWith<_$HistoryElementModelImpl> get copyWith =>
      __$$HistoryElementModelImplCopyWithImpl<_$HistoryElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryElementModelImplToJson(
      this,
    );
  }
}

abstract class _HistoryElementModel implements HistoryElementModel {
  factory _HistoryElementModel(
      {required final int historyId,
      required final UnitModel unit,
      required final String personName,
      required final EventType eventType,
      required final DateTime date}) = _$HistoryElementModelImpl;

  factory _HistoryElementModel.fromJson(Map<String, dynamic> json) =
      _$HistoryElementModelImpl.fromJson;

  @override
  int get historyId;
  @override
  UnitModel get unit;
  @override
  String get personName;
  @override
  EventType get eventType;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$HistoryElementModelImplCopyWith<_$HistoryElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
