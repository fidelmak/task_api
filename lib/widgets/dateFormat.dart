import 'package:intl/intl.dart';

class DateFormats {
  String getCurrentDay() {
    // Get current date
    DateTime now = DateTime.now();

    // Format the date to get the day of the week
    String dayOfWeek = DateFormat('EE').format(now);

    return dayOfWeek;
  }

  String getCurrenHour() {
    // Get current date
    DateTime now = DateTime.now();

    // Format the date to get the day of the week
    String dayOfWeek = DateFormat('HH').format(now);

    return dayOfWeek;
  }

  String getCurrentMinute() {
    // Get current date
    DateTime now = DateTime.now();

    // Format the date to get the day of the week
    String dayOfWeek = DateFormat('m').format(now);

    return dayOfWeek;
  }

  String getCurrentSec() {
    // Get current date
    DateTime now = DateTime.now();

    // Format the date to get the day of the week
    String dayOfWeek = DateFormat('yyyy').format(now);

    return dayOfWeek;
  }
}
