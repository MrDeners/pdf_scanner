import 'package:drift/drift.dart';

class DocumentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get file => text().withDefault(const Constant<String>(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(Constant<DateTime>(DateTime.now()))();
  TextColumn get name => text().withDefault(const Constant<String>(''))();
  IntColumn get pagesAmount => integer().withDefault(const Constant<int>(1))();
}

