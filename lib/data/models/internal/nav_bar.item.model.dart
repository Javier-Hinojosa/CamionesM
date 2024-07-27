import 'package:camionesm/core/values/enums.dart';
import 'package:flutter/material.dart';

class NavBarItem {
  NavBarItems id;
  Widget page;
  IconData icon;
  String label;
  bool haveNotification;
  NavBarItem(this.id,this.icon,this.label, this.page,{this.haveNotification=false});
}