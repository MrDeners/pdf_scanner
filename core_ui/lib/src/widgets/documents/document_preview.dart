import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class DocumentPreview extends StatelessWidget {
  final File file;
  final double height;
  final int pageNumber;
  final bool isActive;
  final VoidCallback? onTap;

  const DocumentPreview({
    required this.file,
    required this.height,
    this.pageNumber = 1,
    this.onTap,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return PdfDocumentLoader.openFile(
      file.path,
      pageNumber: pageNumber,
      onError: (_) => AppIcons.placeholder.call(),
      pageBuilder: (
        BuildContext context,
        PdfPageTextureBuilder textureBuilder,
        Size pageSize,
      ) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: isActive ? colors.accent : Colors.transparent),
            ),
            child: AspectRatio(
              aspectRatio: 0.75,
              child: textureBuilder(),
            ),
          ),
        );
      },
    );
  }
}
