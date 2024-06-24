import 'package:intl/intl.dart';

class AppDateFormatter {
  AppDateFormatter._();

  static String getFormattedDate(String? date,
      {bool withYear = false, withYearAbbr = false}) {
    var formatter = DateFormat('MMM dd, hh:mm:ss a');
    if (withYear) {
      formatter = DateFormat('MMM dd, y, hh:mm:ss a');
    } else if (withYearAbbr) {
      formatter = DateFormat('MMM dd, y, hh:mm:ss a');
    }

    // DateTime time = new DateTime.fromMillisecondsSinceEpoch(int.parse(date));

    String parsed = date != null ? formatter.format(DateTime.parse(date)) : '';
    // String parsed = formatter.format(time);

    return parsed;
  }

  static String formatGroupListDate(int groupByValue) {
    // Get date moments
    final date = DateTime.fromMillisecondsSinceEpoch(groupByValue);
    final now = DateTime.now();
    if (now.difference(date).inDays == 0) {
      return 'Today';
    } else if (now.difference(date).inDays == 1) {
      return 'Yesterday';
    } else {
      return DateFormat('d MMM y').format(date);
    }
  }
}
