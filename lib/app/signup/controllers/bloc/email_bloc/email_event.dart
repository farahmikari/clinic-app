abstract class EmailEvent {
  final String email;

  EmailEvent({required this.email});
}

class InitEmailEvent extends EmailEvent {
  InitEmailEvent({required super.email});
}

class CanSubmitEmail extends EmailEvent {
  dynamic source;
  CanSubmitEmail({required super.email, required this.source});
}
