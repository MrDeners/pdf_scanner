part of 'splash_bloc.dart';

class SplashState {
  final bool? isEndsOnboarding;
  final bool hasSubscription;

  bool get needOnboarding => !(isEndsOnboarding ?? false);

  bool get needShowPaywall => !hasSubscription;

  const SplashState({
    required this.isEndsOnboarding,
    required this.hasSubscription,
  });

  const SplashState.initial()
      : isEndsOnboarding = false,
        hasSubscription = false;

  SplashState copyWith({
    bool? isEndsOnboarding,
    bool? hasSubscription,
  }) {
    return SplashState(
      isEndsOnboarding: isEndsOnboarding ?? this.isEndsOnboarding,
      hasSubscription: hasSubscription ?? this.hasSubscription,
    );
  }
}
