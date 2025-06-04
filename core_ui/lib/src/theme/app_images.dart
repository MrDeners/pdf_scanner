import 'package:core_ui/core_ui.dart';

abstract final class AppImages {
  static const String _basePath = kImagesPath;

  static const String _logo2xKey = '${_basePath}logo2x.png';
  static const AppImage logo2x = AppImage(_logo2xKey);

  static const String _logoKey = '${_basePath}logo.png';
  static const AppImage logo = AppImage(_logoKey);

  static const String _documentKey = '${_basePath}document.png';
  static const AppImage document = AppImage(_documentKey);

  static const String _onboardingFirstKey = '${_basePath}onboarding_first.png';
  static const AppImage onboardingFirst = AppImage(_onboardingFirstKey);

  static const String _onboardingSecondKey = '${_basePath}onboarding_second.png';
  static const AppImage onboardingSecond = AppImage(_onboardingSecondKey);

  static const String _paywallKey = '${_basePath}paywall.png';
  static const AppImage paywall = AppImage(_paywallKey);

  static const String _patternKey = '${_basePath}pattern.png';
  static const AppImage pattern = AppImage(_patternKey);
}
