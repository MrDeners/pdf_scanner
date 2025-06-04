part of validation;

abstract final class ValidationConstants {
  static const double passwordMinLength = 8.0;
  static const int searchMaxLength = 255;

  static RegExp hasCapitalLetterRegExp = RegExp('[A-Z]');
  static RegExp hasLowerLetterRegExp = RegExp('[a-z]');
  static RegExp hasSpecialCharacterRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>_]');
  static RegExp hasNumberRegExp = RegExp('[0-9]');
}
