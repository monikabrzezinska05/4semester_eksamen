import '../models/email_list/email_model.dart';

class SettingsState {
  final List<EmailModel> allEmails;
  final bool isLoading;

  const SettingsState({
    required this.allEmails,
    required this.isLoading,
  });

  SettingsState copyWith({
    List<EmailModel>? allEmails,
    bool? isLoading

  }) {
    return SettingsState(allEmails: allEmails ?? this.allEmails,
        isLoading: isLoading ?? this.isLoading);
  }
}