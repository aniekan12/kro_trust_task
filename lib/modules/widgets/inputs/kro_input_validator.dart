class InputValidators {
  static String? validateField(String? value, String fieldName,
      {int minLength = 1, int maxLength = 255}) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    if (value.length < minLength) {
      return "$fieldName must be at least $minLength characters long";
    }
    if (value.length > maxLength) {
      return "$fieldName must be less than $maxLength characters long";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    return _validateWithPattern(
        value, "Email", emailPattern, "Invalid email address");
  }

  static String? validatePassword(String? value, {int minLength = 6}) {
    return validateField(value, "Password", minLength: minLength);
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return "Amount is required";
    }
    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return "Invalid amount";
    }
    return null;
  }

  static String? validateText(String? value, String fieldName,
      {int minLength = 1, int maxLength = 255}) {
    return validateField(value, fieldName,
        minLength: minLength, maxLength: maxLength);
  }

  static String? _validateWithPattern(
      String? value, String fieldName, String pattern, String errorMessage) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }
}
