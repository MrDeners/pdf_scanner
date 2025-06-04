import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PrintService {
  static Future<void> printDocument(File file) async {
    final Uint8List bytes = await file.readAsBytes();

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => bytes,
      dynamicLayout: false,
      usePrinterSettings: true,
    );
  }
}
