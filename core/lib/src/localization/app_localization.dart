import 'dart:ui';

abstract final class AppLocalization {
  static const String langFolderPath = 'packages/core/resources/lang';

  static const Locale _enLocale = Locale('en', 'US');
  static const Locale _itLocale = Locale('it', 'IT');
  static const Locale _deLocale = Locale('de', 'DE');
  static const Locale _ptLocale = Locale('pt', 'BR');
  static const Locale _esLocale = Locale('es', 'ES');
  static const Locale _frLocale = Locale('fr', 'FR');

  static const List<Locale> supportedLocales = <Locale>[
    _enLocale,
    _itLocale,
    _deLocale,
    _ptLocale,
    _esLocale,
    _frLocale,
  ];

  static Locale get fallbackLocale => _deLocale;
}
