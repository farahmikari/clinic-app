import 'package:clinic_app/generated/l10n.dart';

class Validators {
  static String? validateRequired(String value) =>
      value.isEmpty ? S.current.field_is_required : null;
  static String? validateEmail(String value) {
    const pattern =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regexp = RegExp(pattern);

    if (value.isEmpty) {
      return S.current.field_is_required;
    } else if (!regexp.hasMatch(value)) {
      return S.current.invalid_email;
    }
    return null;
  }

  static String? validatePhone(String value) =>
      value.isEmpty
          ? S.current.field_is_required
          : value.length < 10
          ? S.current.less_than_10_numbers
          : null;

  static String? validatePassword(String value) =>
      value.isEmpty
          ? S.current.field_is_required
          : value.length < 8
          ? S.current.password_must_be_8_letters_at_least
          : null;
  static String? validateConPassword(String value, String orginal) =>
      value.isEmpty
          ? S.current.field_is_required
          : value.length < 8
          ? S.current.password_must_be_8_letters_at_least
          : value != orginal
          ? S.current.the_password_dont_match
          : null;
}
