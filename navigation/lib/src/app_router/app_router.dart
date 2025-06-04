import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        ...AuthRouter().routes,
        ...OnboardingRouter().routes,
        ...PaywallRouter().routes,
        ...HomeRouter().routes,
        ...DocPreviewRouter().routes,
      ];

  Future<void> navigateBack([dynamic result]) async {
    await maybePop(result);
  }

  Future<void> navigateOnboarding(OnboardingType type) async {
    await replace(OnboardingRoute(type: type));
  }

  Future<void> navigateHome() async {
    await replace(const HomeRoute());
  }

  Future<void> navigatePaywall(String placement) async {
    await push(PaywallRoute(placement: placement));
  }

  Future<void> navigateDocPreview(DocumentData value) async {
    await push(DocPreviewRoute(document: value));
  }

  Future<void> navigateDocRename(DocumentData value) async {
    await push(RenamePopup(document: value));
  }

  Future<Uint8List?> navigateImageEditor(Uint8List value) async {
    final Uint8List? result = await push(ImageEditorRoute(bytes: value));

    return result;
  }
}
