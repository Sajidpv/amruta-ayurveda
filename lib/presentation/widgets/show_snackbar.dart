import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackbar({Color? color, required String message}) {
  return Get.rawSnackbar(
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white, fontSize: 14),
    ),
    isDismissible: false,
    duration: const Duration(milliseconds: 2000),
    backgroundColor: color != null ? color : Colors.red[400]!,
    margin: EdgeInsets.zero,
    snackStyle: SnackStyle.GROUNDED,
  );
}
