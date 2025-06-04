part of repositories;

@Singleton(as: UserRepository)
final class UserRepositoryImpl implements UserRepository {
  final LocalDataProvider _localDataProvider;

  const UserRepositoryImpl({
    required LocalDataProvider localDataProvider,
  }) : _localDataProvider = localDataProvider;

  @override
  bool? fetchOnboardingStatus() {
    final bool? result = _localDataProvider.read<bool>(
      key: LocalDataConstants.onboardingStatusKey,
    );

    return result;
  }

  @override
  Future<void> endsOnboarding() async {
    await _localDataProvider.write<bool>(
      key: LocalDataConstants.onboardingStatusKey,
      value: true,
    );
  }
}
