class TValidator {
  ///------------------------------------------------- validate name
  static String? validateName(String? value, {String? name}) {
    if (value == null || value.isEmpty) {
      return '$name is required.';
    }
    return null;
  }

  ///------------------------------------------------- validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
// Regular expression for email validation
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  ///------------------------------------------------- validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
// Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
// Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
// Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }
// Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}[<>]'))) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  ///------------------------------------------------- validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
// Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}
