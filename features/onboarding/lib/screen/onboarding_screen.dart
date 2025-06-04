import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:onboarding/bloc/onboarding_bloc.dart';
import 'package:onboarding/screen/onboarding_content.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  final OnboardingType type;

  const OnboardingScreen({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (_) => OnboardingBloc(
        appRouter: appLocator<AppRouter>(),
        endsOnboardingUsecase: appLocator<EndsOnboardingUseCase>(),
      )..add(Initialize(type)),
      child: const OnboardingContent(),
    );
  }
}
