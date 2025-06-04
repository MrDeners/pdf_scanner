part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class Initialize extends HomeEvent {
  const Initialize();
}

class SortByDateTime extends HomeEvent {
  const SortByDateTime();
}

class Scan extends HomeEvent {
  const Scan();
}

class ChangeSearch extends HomeEvent {
  final String value;

  const ChangeSearch(this.value);
}

class Print extends HomeEvent {
  final int index;

  const Print(this.index);
}

class NavigateDocRename extends HomeEvent {
  final int index;

  const NavigateDocRename(this.index);
}

class NavigatePreview extends HomeEvent {
  final int index;

  const NavigatePreview(this.index);
}

class Share extends HomeEvent {
  final int index;

  const Share(this.index);
}

class Delete extends HomeEvent {
  final int index;

  const Delete(this.index);
}
