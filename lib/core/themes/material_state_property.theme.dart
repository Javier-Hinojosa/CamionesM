import 'package:flutter/material.dart';

// Usando WidgetStateProperty para definir colores basados en el estado
final buttonColor = WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  if (states.contains(WidgetState.pressed)) {
    return Colors.blueGrey; // Color cuando el botón está presionado
  } else if (states.contains(WidgetState.disabled)) {
    return Colors.grey; // Color cuando el botón está deshabilitado
  }
  return Colors.white; // Color por defecto
});