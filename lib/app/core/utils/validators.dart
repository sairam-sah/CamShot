import 'package:get/get.dart';

class SValidator {
  static String? emailValidator(String? value) {
    if (!value!.isEmail) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String? stringValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required*';
    } else {
      return null;
    }
  }

  static String? numberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Invalid number';
    }

    if (value.length < 10 || value.length > 12) {
      return 'Invalid number';
    }

    if (!value.startsWith('+')) {
      if (value.isNumericOnly) {
        return null;
      } else {
        return 'Invalid number';
      }
    }

    if (value.substring(1).isNumericOnly) {
      return null;
    } else {
      return 'Invalid number';
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.length < 6) {
      return 'Password should be at least 6 characters';
    } else {
      return null;
    }
  }
}
