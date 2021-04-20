import 'package:get/get.dart';

enum eventFrequency { noRepeat, everyWeek }

class JobApplicationController extends GetxController {
  final startDateTime = DateTime.now().obs;
  final frequency = eventFrequency.noRepeat.obs;
}
