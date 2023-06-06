import 'package:dictionary/constants.dart';
import 'package:dictionary/generated/l10n.dart';
import 'package:email_validator/email_validator.dart';

// ignore: avoid_classes_with_only_static_members
class Validators {
  static String? validateEmail(String? email) {
    final strings = S.current;

    if (email != null) {
      final isEmailValid = EmailValidator.validate(email);
      if (!isEmailValid) {
        return strings.emailIsNotValid;
      }

      return null;
    } else {
      return strings.emailIsRequired;
    }
  }

  static String? validateName(String? name) {
    final strings = S.current;

    if (name != null) {
      if (name.length < kMinNameLength || name.length > kMaxNameLength) {
        return strings.nameMustContainFrom1To50Symbols;
      } else if (!nameRegExp.hasMatch(name)) {
        return strings.nameIsNotValid;
      }

      return null;
    } else {
      return strings.nameIsRequired;
    }
  }

  static String? validatePassword(String? password) {
    final strings = S.current;

    if (password != null) {
      if (password.length < kMinPasswordLength) {
        return strings.passwordMustContainAtLeast8Symbols;
      } else if (!passwordRegExp.hasMatch(password)) {
        return strings.passwordIsNotValid;
      }

      return null;
    } else {
      return strings.passwordIsRequired;
    }
  }
}
