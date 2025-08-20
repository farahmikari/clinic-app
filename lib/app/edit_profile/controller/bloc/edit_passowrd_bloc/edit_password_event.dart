class EditPasswordEvent  {}
class OldPasswordEvent extends EditPasswordEvent {
  final String password;

  OldPasswordEvent({required this.password});
}

class OldObscurEvent extends EditPasswordEvent {
  final bool obscure;

  OldObscurEvent({required this.obscure});
}
class PasswordEvent extends EditPasswordEvent {
  final String password;

  PasswordEvent({required this.password});
}

class ObscurEvent extends EditPasswordEvent {
  final bool obscure;

  ObscurEvent({required this.obscure});
}

class ConPasswordEvent extends EditPasswordEvent {
  final String password;

  ConPasswordEvent({required this.password});
}

class ConObscurEvent extends EditPasswordEvent {
  final bool obscure;

  ConObscurEvent({required this.obscure});
}

class EditButtonEvent extends EditPasswordEvent {}
class EditSubmitEvent extends EditPasswordEvent {}