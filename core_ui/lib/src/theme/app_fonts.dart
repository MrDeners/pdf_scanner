import 'package:core_ui/core_ui.dart';

abstract final class AppFonts {
  static const String _sfProFamily = 'SF Pro';

  static const TextStyle base = TextStyle(
    height: 1.2,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w400,
    package: kPackageName,
  );

  static const double fontSize36 = 36.0;
  static const double fontSize21 = 21.0;
  static const double fontSize20 = 20.0;
  static const double fontSize18 = 18.0;
  static const double fontSize15 = 15.0;
  static const double fontSize14 = 14.0;

  static const TextStyle h1 = TextStyle(
    fontSize: fontSize36,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w600,
    package: kPackageName,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: fontSize21,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w600,
    package: kPackageName,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: fontSize20,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w500,
    package: kPackageName,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: fontSize18,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w500,
    package: kPackageName,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: fontSize15,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w500,
    package: kPackageName,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: fontSize14,
    fontFamily: _sfProFamily,
    fontWeight: FontWeight.w500,
    package: kPackageName,
  );
}
