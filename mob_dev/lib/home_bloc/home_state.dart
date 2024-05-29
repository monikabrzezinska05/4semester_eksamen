import 'package:flutter/material.dart';
import 'package:mob_dev/models/unit/unit_model.dart';

class HomeState {
  final Map<UnitType, List<UnitModel>> units;
  final bool isLoading;
  final Color indicatorColor;
  final List<UnitModel> allUnits;

  const HomeState({
    required this.units,
    required this.isLoading,
    this.indicatorColor = Colors.black,
    this.allUnits = const [],
  });

  copyWith({
    Map<UnitType, List<UnitModel>>? units,
    List<UnitModel>? allUnits,
    bool? isLoading,
    Color? indicatorColor,
  }) {
    return HomeState(
      units: units ?? this.units,
      isLoading: isLoading ?? this.isLoading,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      allUnits: allUnits ?? this.allUnits,
    );
  }
}