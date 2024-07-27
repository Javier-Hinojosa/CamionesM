import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

abstract class Globals{

  static const Color backGroundColor =  Color(0xfff1f0f0);
  static const Color principalColor  =  Color(0xfff6c700);
  static const Color secondColor = Colors.black;

  static const String currentLocale = 'es';
  static const String currentCountry = 'MX';
  static const String currentLocaleComplete = 'es_MX';

  static const List<String> principalStates= ["CDMX", "Puebla","Querétaro","Jalisco","Oaxaca","Monterrey"];
  static const List<String> typeProducts= ["Textiles", "Alimentos","Electrodomesticos","Inmobiliaria","Tecnología","Textiles","Otro"];

  static const List<LatLng> points = [
     LatLng(19.432608, -99.133209), // Ciudad de México
     LatLng(20.659698, -103.349609), // Guadalajara
     LatLng(21.161908, -86.851528), // Cancún
  ];


}