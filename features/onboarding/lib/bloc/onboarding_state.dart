part of 'onboarding_bloc.dart';

class OnboardingState {
  final OnboardingType type;

  final bool isLoading;

  const OnboardingState({
    required this.type,
    required this.isLoading,
  });

  const OnboardingState.initial()
      : type = OnboardingType.app,
        isLoading = false;

  OnboardingState copyWith({
    OnboardingType? type,
    bool? isLoading,
  }) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      type: type ?? this.type,
    );
  }
}
