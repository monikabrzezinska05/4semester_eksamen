import '../models/email_list/email_model.dart';

class EmailListState {
  final List<EmailModel> allEmails;
  final bool isLoading;

  const EmailListState({
    required this.allEmails,
    required this.isLoading,
  });

  EmailListState copyWith({
    List<EmailModel>? allEmails,
    bool? isLoading

  }) {
    return EmailListState(allEmails: allEmails ?? this.allEmails,
        isLoading: isLoading ?? this.isLoading);
  }
}