part of 'paywall_bloc.dart';

abstract class PaywallEvent {
  const PaywallEvent();
}

class Initialize extends PaywallEvent {
  final String value;

  const Initialize(this.value);
}

class MakePurchase extends PaywallEvent {
  const MakePurchase();
}

class OpenPrivacy extends PaywallEvent {
  const OpenPrivacy();
}

class OpenTerms extends PaywallEvent {
  const OpenTerms();
}

class Restore extends PaywallEvent {
  final AsyncCallback onFailure;

  const Restore(this.onFailure);
}

class NavigateBack extends PaywallEvent {
  const NavigateBack();
}

class ChangeSelectedIndex extends PaywallEvent {
  final int value;

  const ChangeSelectedIndex(this.value);
}
