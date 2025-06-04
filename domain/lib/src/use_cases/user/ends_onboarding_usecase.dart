part of user_usecases;

final class EndsOnboardingUseCase extends UseCase<NoParams, void> {
  final UserRepository _userRepository;

  EndsOnboardingUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  void execute([NoParams payload = const NoParams()]) {
    _userRepository.endsOnboarding();
  }
}
