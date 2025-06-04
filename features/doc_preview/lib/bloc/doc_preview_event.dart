part of 'doc_preview_bloc.dart';

abstract class DocPreviewEvent {
  const DocPreviewEvent();
}

class Initialize extends DocPreviewEvent {
  final DocumentData document;

  const Initialize(this.document);
}

class Share extends DocPreviewEvent {
  const Share();
}

class Edit extends DocPreviewEvent {
  const Edit();
}

class Add extends DocPreviewEvent {
  const Add();
}

class NavigateBack extends DocPreviewEvent {
  const NavigateBack();
}

class ChangeSelectedPageIndex extends DocPreviewEvent {
  final int value;

  const ChangeSelectedPageIndex(this.value);
}
