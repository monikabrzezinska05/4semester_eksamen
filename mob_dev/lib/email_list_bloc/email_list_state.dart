import '../models/email_list/email_list_model.dart';

class EmailListState {
  final List<EmailListModel> allEmails;
  final bool isLoading;

  const EmailListState({
    required this.allEmails,
    required this.isLoading,
  });

  EmailListState copyWith({
    List<EmailListModel>? allEmails,
    bool? isLoading

  }) {
    return EmailListState(allEmails: allEmails ?? this.allEmails,
        isLoading: isLoading ?? this.isLoading);
  }
}