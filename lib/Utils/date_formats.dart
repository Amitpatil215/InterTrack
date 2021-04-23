import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('EE, dd MMM, yyyy').format(date);
}

String formatDateEEDDMMM(DateTime date) {
  return DateFormat('EE, dd MMM').format(date);
}

String formatTime(DateTime date) {
  return DateFormat('hh:MM aa').format(date).toLowerCase();
}

/// Convert Time of Day to DateTime
/// if dateTime is not provider then time of day merged with current date time
DateTime timeOfDayToDateTime(TimeOfDay timeOfDay, {DateTime? dateTime}) {
  if (dateTime != null) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour,
        timeOfDay.minute);
  } else {
    final now = new DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }
}
