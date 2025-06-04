part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class Initialize extends OnboardingEvent {
  final OnboardingType value;

  const Initialize(this.value);
}

class EndsAppOnboarding extends OnboardingEvent {
  const EndsAppOnboarding();
}
