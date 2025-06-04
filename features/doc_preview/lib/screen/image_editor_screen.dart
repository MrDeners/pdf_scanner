import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class ImageEditorScreen extends StatelessWidget {
  final Uint8List bytes;

  const ImageEditorScreen({
    required this.bytes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProImageEditor.memory(
      bytes,
      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (Uint8List bytes) =>
            appLocator.get<AppRouter>().navigateBack(bytes),
      ),
    );
  }
}
