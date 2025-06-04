import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:paywall/bloc/paywall_bloc.dart';
import 'package:paywall/screen/paywall_content.dart';

@RoutePage()
class PaywallScreen extends StatelessWidget {
  final String placement;

  const PaywallScreen({
    required this.placement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaywallBloc>(
      lazy: false,
      create: (_) => PaywallBloc(
        appRouter: appLocator<AppRouter>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
        fetchOfferingUsecase: appLocator<FetchPaywallUseCase>(),
        restorePurchasesUsecase: appLocator<RestorePurchasesUseCase>(),
      )..add(Initialize(placement)),
      child: const PaywallContent(),
    );
  }
}
