part of repositories;

abstract interface class UserRepository {
  bool? fetchOnboardingStatus();

  Future<void> endsOnboarding();
}
