import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AppRouter _appRouter;
  final EndsOnboardingUseCase _endsOnboardingUsecase;

  OnboardingBloc({
    required AppRouter appRouter,
    required EndsOnboardingUseCase endsOnboardingUsecase,
  })  : _appRouter = appRouter,
        _endsOnboardingUsecase = endsOnboardingUsecase,
        super(const OnboardingState.initial()) {
    on<Initialize>(_onInitialize);
    on<EndsAppOnboarding>(_onEndsAppOnboarding);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(type: event.value));
  }

  Future<void> _onEndsAppOnboarding(
    EndsAppOnboarding event,
    Emitter<OnboardingState> emit,
  ) async {
    _endsOnboardingUsecase.execute();

    await _appRouter.navigatePaywall(PaywallPlacements.onboarding_v1.name);

    await _appRouter.navigateHome();
  }
}
