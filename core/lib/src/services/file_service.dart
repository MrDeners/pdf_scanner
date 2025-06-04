import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_render/pdf_render.dart' as pdf_render;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:uuid/uuid.dart';

abstract final class FileService {
  static Future<File> saveFile(File file) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();

    final String fileName = path.basename(file.path);
    final String newPath = path.join(appDocDir.path, fileName);

    final File savedFile = await file.copy(newPath);

    return savedFile;
  }

  static Future<int> getPagesAmount(File file) async {
    final pdf_render.PdfDocument document = await pdf_render.PdfDocument.openFile(file.path);

    return document.pageCount;
  }

  static Future<File> createPdfFromImages(List<String> paths) async {
    final pw.Document pdf = pw.Document();

    for (final String path in paths) {
      final Uint8List image = File(path).readAsBytesSync();
      final pw.MemoryImage imageWidget = pw.MemoryImage(image);

      pdf.addPage(
        pw.Page(
          margin: pw.EdgeInsets.zero,
          build: (pw.Context context) => pw.Center(child: pw.Image(imageWidget)),
        ),
      );
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    final String outputPath = '${dir.path}/${const Uuid().v4()}.pdf';

    final File outputFile = File(outputPath);
    await outputFile.writeAsBytes(await pdf.save());

    return outputFile;
  }

  static Future<File> mergePdfFiles(File pdf1, File pdf2) async {
    final List<int> bytes1 = await pdf1.readAsBytes();
    final List<int> bytes2 = await pdf2.readAsBytes();

    final PdfDocument document1 = PdfDocument(inputBytes: bytes1);
    final PdfDocument document2 = PdfDocument(inputBytes: bytes2);
    final PdfDocument mergedDocument = PdfDocument();

    for (int i = 0; i < document1.pages.count; i++) {
      mergedDocument.pages.add().graphics.drawPdfTemplate(
            document1.pages[i].createTemplate(),
            Offset.zero,
          );
    }

    for (int i = 0; i < document2.pages.count; i++) {
      mergedDocument.pages.add().graphics.drawPdfTemplate(
            document2.pages[i].createTemplate(),
            Offset.zero,
          );
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    final String outputPath = path.join(
      dir.path,
      'merged_${const Uuid().v4()}.pdf',
    );

    final File outputFile = File(outputPath);
    final List<int> savedBytes = await mergedDocument.save();
    await outputFile.writeAsBytes(savedBytes);

    document1.dispose();
    document2.dispose();
    mergedDocument.dispose();

    return outputFile;
  }

  static Future<Uint8List> getPageAsBytes(File file, int pageNumber) async {
    final pdf_render.PdfDocument doc = await pdf_render.PdfDocument.openFile(file.path);
    final pdf_render.PdfPage page = await doc.getPage(pageNumber);
    final pdf_render.PdfPageImage pageImage = await page.render();

    final Uint8List imageBytes = await pageImage.createImageIfNotAvailable().then(
      (Image img) async {
        final ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);

        return byteData!.buffer.asUint8List();
      },
    );

    return imageBytes;
  }

  static Future<File> replacePagePdf({
    required File originalFile,
    required int pageNumberToReplace,
    required Uint8List replacementImageBytes,
  }) async {
    final pw.Document pdf = pw.Document();

    final int pageCount = await getPagesAmount(originalFile);

    for (int i = 0; i < pageCount; i++) {
      if (i == pageNumberToReplace - 1) {
        final pw.MemoryImage imageWidget = pw.MemoryImage(replacementImageBytes);
        pdf.addPage(
          pw.Page(
            margin: pw.EdgeInsets.zero,
            build: (pw.Context context) => pw.Center(
              child: pw.Image(imageWidget),
            ),
          ),
        );
      } else {
        final Uint8List originalPageImageBytes =
            await FileService.getPageAsBytes(originalFile, i + 1);
        final pw.MemoryImage imageWidget = pw.MemoryImage(originalPageImageBytes);
        pdf.addPage(
          pw.Page(
            margin: pw.EdgeInsets.zero,
            build: (pw.Context context) => pw.Center(
              child: pw.Image(imageWidget),
            ),
          ),
        );
      }
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    final String outputPath = path.join(dir.path, 'replaced_page_${const Uuid().v4()}.pdf');
    final File resultFile = File(outputPath);
    await resultFile.writeAsBytes(await pdf.save());

    return resultFile;
  }
}
