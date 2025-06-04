part of 'rename_bloc.dart';

abstract class RenameEvent {
  const RenameEvent();
}

class ChangeName extends RenameEvent {
  final String value;

  const ChangeName(this.value);
}

class Save extends RenameEvent {
  const Save();
}

class NavigateBack extends RenameEvent {
  const NavigateBack();
}
