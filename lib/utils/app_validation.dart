class AppValidation {
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return 'Invalid email address';
    return null;
  }

  static String? minLength(String? value, int length) {
    if (value == null || value.length < length) {
      return 'Minimum length is $length characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String? original) {
    if (value != original) {
      return 'Passwords do not match';
    }
    return null;
  }
}
