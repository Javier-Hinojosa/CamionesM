import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';


class CustomWidgetStateProperty{
// Usando WidgetStateProperty para definir colores basados en el estado
static buttonColor ()=>WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  if (states.contains(WidgetState.pressed)) {
    return Colors.blueGrey; // Color cuando el botón está presionado
  } else if (states.contains(WidgetState.disabled)) {
    return Colors.grey; // Color cuando el botón está deshabilitado
  }
  return Colors.white; // Color por defecto
});

static principalColor ()=>WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  if (states.contains(WidgetState.pressed)) {
    return Globals.principal2Color;
  } else if (states.contains(WidgetState.disabled)) {
    return Colors.grey;
  }
  else if (states.contains(WidgetState.selected)) {
    return Globals.principalColor;
  }
  else if (states.contains(WidgetState.error)) {
    return Colors.redAccent;
  }
  else if (states.contains(WidgetState.dragged)) {
    return Colors.grey;
  }
  return Colors.transparent; // Color por defecto
});
}