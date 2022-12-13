import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  String get formatDateTime {
    final parsedDateTime = DateTime.parse(toString());
    final formattedDate = DateFormat.yMMMMd().format(parsedDateTime);
    return formattedDate;
  }
}
