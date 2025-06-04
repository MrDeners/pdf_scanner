library doc_preview;

import 'package:navigation/navigation.dart';

export 'doc_preview.gr.dart';

@AutoRouterConfig()
class DocPreviewRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: DocPreviewRoute.page),
        AutoRoute(page: ImageEditorRoute.page),
      ];
}
