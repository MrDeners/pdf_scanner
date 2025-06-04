part of 'app_bloc.dart';

class AppState {
  final String toastMessage;
  final ToastType toastType;

  const AppState.initial()
      : toastMessage = '',
        toastType = ToastType.error;

  const AppState({
    required this.toastMessage,
    required this.toastType,
  });

  AppState copyWith({
    String? toastMessage,
    ToastType? toastType,
  }) {
    return AppState(
      toastMessage: toastMessage ?? this.toastMessage,
      toastType: toastType ?? this.toastType,
    );
  }
}
