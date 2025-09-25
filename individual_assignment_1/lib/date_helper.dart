import 'package:intl/intl.dart';

class DateHelper {
  // Check if two dates are the same day
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Format date nicely
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  // Format time nicely
  static String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }
}
