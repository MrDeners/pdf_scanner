import 'package:auth/splash/bloc/splash_bloc.dart';
import 'package:auth/splash/screen/splash_content.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      lazy: false,
      create: (_) => SplashBloc(
        appRouter: appLocator<AppRouter>(),
        initializePaywallsUsecase: appLocator<InitializePaywallsUseCase>(),
        fetchOnboardingStatusUsecase: appLocator<FetchOnboardingStatusUseCase>(),
        fetchSubscriptionStatusUsecase: appLocator<FetchSubscriptionStatusUseCase>(),
      )..add(const Initialize()),
      child: const SplashContent(),
    );
  }
}
