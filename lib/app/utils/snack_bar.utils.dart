import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static SnackbarController success(String? message,
      {title = 'Operación correcta'}) =>
      _showSnack(message!, title, colorStatus: Colors.lightGreen);

  static SnackbarController error(String message,
      {String title = "Ocurrio un problema"}) =>
      _showSnack(message, title,
          colorStatus: Colors.red, colorTitle: Colors.white);

  static SnackbarController advertence(String message,
      {String title = "Advertencia"}) =>
      _showSnack(message, title, colorStatus: Colors.yellowAccent);

  static SnackbarController _showSnack(String message, String title,
      {required Color colorStatus, Color colorTitle = Colors.black}) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: colorStatus,
      colorText: colorTitle,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
    );
  }
}