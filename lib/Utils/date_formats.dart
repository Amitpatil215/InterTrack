import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('EE, dd MMM, yyyy').format(date);
}

String formatTime(DateTime date) {
  return DateFormat('hh:MM aa').format(date).toLowerCase();
}

/// Convert Time of Day to DateTime
DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) {
  final now = new DateTime.now();
  return DateTime(
      now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
}
