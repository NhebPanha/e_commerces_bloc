import 'package:intl/intl.dart';

class AppDateFormatter {
  /// Format date as yyyy-MM-dd (e.g. 2025-08-07)
  static String yyyyMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Format date as dd/MM/yyyy (e.g. 07/08/2025)
  static String ddMMyyyy(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Format date as MMMM dd, yyyy (e.g. August 07, 2025)
  static String longDate(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  /// Format time hh:mm a (e.g. 09:15 PM)
  static String timeHm(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  /// Format with custom pattern
  static String formatCustom(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  // Example: Format date with locale
  static String formatWithLocale(DateTime date, String pattern, String locale) {
    return DateFormat(pattern, locale).format(date);
  }
}
