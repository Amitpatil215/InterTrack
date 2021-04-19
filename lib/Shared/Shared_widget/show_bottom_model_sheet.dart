import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showCustomBottomModelSheet(BuildContext context, Widget child) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Get.width * 0.02),
      ),
    ),
    builder: (context) {
      return child;
    },
  );
}
