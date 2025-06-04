import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;
  final InitializePaywallsUseCase _initializePaywallsUsecase;
  final FetchOnboardingStatusUseCase _fetchOnboardingStatusUsecase;
  final FetchSubscriptionStatusUseCase _fetchSubscriptionStatusUsecase;

  SplashBloc({
    required AppRouter appRouter,
    required InitializePaywallsUseCase initializePaywallsUsecase,
    required FetchOnboardingStatusUseCase fetchOnboardingStatusUsecase,
    required FetchSubscriptionStatusUseCase fetchSubscriptionStatusUsecase,
  })  : _appRouter = appRouter,
        _initializePaywallsUsecase = initializePaywallsUsecase,
        _fetchOnboardingStatusUsecase = fetchOnboardingStatusUsecase,
        _fetchSubscriptionStatusUsecase = fetchSubscriptionStatusUsecase,
        super(const SplashState.initial()) {
    on<Initialize>(_onInitialize);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<SplashState> emit,
  ) async {
    //TODO: Uncomment after adding api key
    // await _initializePaywallsUsecase.execute();

    final bool? isEndsOnboarding = _fetchOnboardingStatusUsecase.execute();
    final bool hasSubscription = await _fetchSubscriptionStatusUsecase.execute();

    emit(
      state.copyWith(
        isEndsOnboarding: isEndsOnboarding,
        hasSubscription: hasSubscription,
      ),
    );

    await _entrypointProcessing(emit);
  }

  Future<void> _entrypointProcessing(Emitter<SplashState> emit) async {
    if (state.needOnboarding) {
      await _appRouter.navigateOnboarding(OnboardingType.app);
    } else if (state.needShowPaywall) {
      await _appRouter.navigatePaywall(PaywallPlacements.app_launch_v1.name);
      emit(state.copyWith(hasSubscription: true));
      await _entrypointProcessing(emit);
    } else {
      await _appRouter.navigateHome();
    }
  }
}
