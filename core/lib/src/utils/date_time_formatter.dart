import 'package:intl/intl.dart';

abstract final class DateTimeFormatter {
  static final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');

  static String format(DateTime datetime) {
    return _dateFormatter.format(datetime);
  }
}
