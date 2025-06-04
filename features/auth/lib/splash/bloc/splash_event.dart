part of 'splash_bloc.dart';

abstract class SplashEvent {
  const SplashEvent();
}

class Initialize extends SplashEvent {
  const Initialize();
}
