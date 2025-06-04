part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class CoreUiEventReceived extends AppEvent {
  final CoreUiEvent data;

  const CoreUiEventReceived(this.data);
}

class Clear extends AppEvent {
  const Clear();
}
