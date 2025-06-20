class Validators {
  static String? validateRequired(String value) =>
      value.isEmpty ? "Field is required!" : null;
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
      return "Field is required!";
    } else if (!regexp.hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  static String? validatePhone(String value) =>
      value.isEmpty
          ? "Field is required!"
          : value.length < 10
          ? "less than 10 numbers"
          : null;

  static String? validatePassword(String value) =>
      value.isEmpty
          ? "Field is required!"
          : value.length < 8
          ? "Password must be 8 letters at least"
          : null;
  static String? validateConPassword(String value, String orginal) =>
      value.isEmpty
          ? "Field is required!"
          : value.length < 8
          ? "Password must be 8 letters at least"
          : value != orginal
          ? "The passwords don't match"
          : null;
}
