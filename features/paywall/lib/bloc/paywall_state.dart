part of 'paywall_bloc.dart';

class PaywallState {
  final Offering? offering;
  final int selectedIndex;

  final bool isLoading;

  const PaywallState({
    required this.isLoading,
    required this.offering,
    required this.selectedIndex,
  });

  const PaywallState.initial()
      : isLoading = false,
        offering = null,
        selectedIndex = 0;

  PaywallState copyWith({
    bool? isLoading,
    Offering? offering,
    int? selectedIndex,
  }) {
    return PaywallState(
      isLoading: isLoading ?? this.isLoading,
      offering: offering ?? this.offering,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
