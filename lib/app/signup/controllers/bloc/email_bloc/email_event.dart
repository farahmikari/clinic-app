abstract class EmailEvent {
  final String email;

  EmailEvent({required this.email});
}

class InitEmailEvent extends EmailEvent {
  InitEmailEvent({required super.email});
}

class CanSubmitEmail extends EmailEvent {
  bool signUp;
  CanSubmitEmail({required super.email, required this.signUp});
}
