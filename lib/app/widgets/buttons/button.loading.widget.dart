import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonLoading extends CustomButton {
  final String title;
  final Color? textColor;
  final bool isLoading;

  CustomButtonLoading({
    super.key,
    this.title = "",
    this.textColor,
    this.isLoading = false,
    super.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isLoading ? 60.0 : width, // Cambia el tamaño según el estado de carga
      height: isLoading ? 60.0 : height, // Tamaño pequeño durante la carga
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0)),
      child: CustomButton.child(
        onPressed: isLoading ? null : onPressed, // Deshabilitar el botón si está cargando
        onLongPressed: isLoading ? null : onLongPressed,
        backgroundColor: backgroundColor,
        height: height,
        width: width,
        child: isLoading
            ? SizedBox(
            width: 24.0,
            height: 24.0,
            child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(textColor ?? Colors.white)))
            : Container(
            alignment: Alignment.center,
            width: width??Get.width,
            height: height,
            child: Text(title, style: TextStyle(color: validateTextColor(),fontWeight: FontWeight.w600))
        )
      ),
    );
  }
}
