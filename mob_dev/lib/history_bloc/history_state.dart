import '../models/history/history_model.dart';

class HistoryState {
  final List<HistoryModel> allHistory;
  final List<HistoryModel> shownHistory;
  List<String> get units => allHistory.map((historyModel) => historyModel.unit.name).toSet().toList();
  List<String> get eventTypes => allHistory.map((historyModel) => historyModel.eventType.name).toSet().toList();
  List<String> get persons => allHistory.map((historyModel) => historyModel.personName).toSet().toList();
  final bool isLoading;

  final String selectedUnit;
  final String selectedEventType;
  final String selectedPerson;

  const HistoryState({
    required this.allHistory,
    required this.shownHistory,
    required this.selectedUnit,
    required this.selectedEventType,
    required this.selectedPerson,
    required this.isLoading,
  });

  factory HistoryState.initial() {
    return HistoryState(
      allHistory: [],
      shownHistory: [],
      selectedUnit: '',
      selectedEventType: '',
      selectedPerson: '',
      isLoading: true
    );
  }

  HistoryState copyWith({
    List<HistoryModel>? allHistory,
    List<HistoryModel>? shownHistory,
    String? selectedUnit,
    String? selectedEventType,
    String? selectedPerson,
    bool? isLoading
  }) {
    return HistoryState(
      allHistory: allHistory ?? this.allHistory,
      shownHistory: shownHistory ?? this.shownHistory,
      selectedUnit: selectedUnit ?? this.selectedUnit,
      selectedEventType: selectedEventType ?? this.selectedEventType,
      selectedPerson: selectedPerson ?? this.selectedPerson,
      isLoading: isLoading ?? this.isLoading
    );
  }
}