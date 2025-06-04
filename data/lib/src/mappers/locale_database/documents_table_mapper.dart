import 'dart:io';

import 'package:data/src/providers/local_database/provider/local_database_provider.dart';
import 'package:domain/domain.dart';
import 'package:drift/drift.dart';

class DocumentsTableMapper {
  static DocumentData fromRow(DocumentsTableData categoryData) {
    return DocumentData(
      id: categoryData.id,
      name: categoryData.name,
      file: File(categoryData.file),
      createdAt: categoryData.createdAt,
      pagesAmount: categoryData.pagesAmount,
    );
  }

  static DocumentsTableCompanion toCompanion(DocumentData document) {
    return DocumentsTableCompanion.insert(
      name: Value<String>(document.name),
      file: Value<String>(document.file.path),
      createdAt: Value<DateTime>(document.createdAt),
      pagesAmount: Value<int>(document.pagesAmount),
    );
  }
}
