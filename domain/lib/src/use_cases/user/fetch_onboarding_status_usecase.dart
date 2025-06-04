part of user_usecases;

final class FetchOnboardingStatusUseCase extends UseCase<NoParams, bool?> {
  final UserRepository _userRepository;

  FetchOnboardingStatusUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  bool? execute([NoParams payload = const NoParams()]) {
    return _userRepository.fetchOnboardingStatus();
  }
}
