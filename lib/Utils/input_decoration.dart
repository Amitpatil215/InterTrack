import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Utils/utils.dart';

InputDecoration inputDecoration({String? labelText}) {
  return InputDecoration(
    fillColor: formFieldColor,
    labelText: labelText,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Get.width * 0.01),
    ),
    filled: true,
  );
}
