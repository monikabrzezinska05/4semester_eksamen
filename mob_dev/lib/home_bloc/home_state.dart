import 'package:mob_dev/models/unit/unit_model.dart';

class HomeState {
  final Map<UnitType, List<UnitModel>> units;
  final bool isLoading;

  const HomeState({
    required this.units,
    required this.isLoading,
  });

  copyWith({
    Map<UnitType, List<UnitModel>>? units,
    List<UnitModel>? allUnits,
    bool? isLoading,
  }) {
    return HomeState(
      units: units ?? this.units,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}