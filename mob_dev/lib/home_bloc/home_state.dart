import 'package:mob_dev/models/unit/unit_model.dart';

class HomeState {
  final Map<String, List<UnitModel>> units;
  final bool isLoading;

  const HomeState({
    required this.units,
    required this.isLoading,
  });

  copyWith({
    Map<String, List<UnitModel>>? units,
    bool? isLoading,
  }) {
    return HomeState(
      units: units ?? this.units,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}