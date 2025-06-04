import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:onboarding/bloc/onboarding_bloc.dart';
import 'package:onboarding/widgets/app_onboarding/app_onboarding.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent();

  @override
  Widget build(BuildContext context) {
    final OnboardingBloc bloc = context.read<OnboardingBloc>();

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (BuildContext context, OnboardingState state) {
        return AppScaffold(
          hasScrollBody: false,
          hasAppBar: false,
          hasPadding: false,
          content: _selectOnboarding(bloc, state.type),
        );
      },
    );
  }

  Widget _selectOnboarding(OnboardingBloc bloc, OnboardingType type) {
    return switch (type) {
      OnboardingType.app => AppOnboarding(
          onSuccess: () => bloc.add(const EndsAppOnboarding()),
        ),
    };
  }
}
