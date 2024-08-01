
import 'package:flutter/material.dart';

abstract class ListItem {
  IconData icon;
  String label;
  bool haveNotification;
  ListItem(this.icon,this.label,{required this.haveNotification});
}