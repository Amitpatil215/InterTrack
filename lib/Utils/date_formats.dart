import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('EE, dd MMM, yyyy').format(date);
}

String formatTime(DateTime date) {
  return DateFormat('hh:MM aa').format(date).toLowerCase();
}
