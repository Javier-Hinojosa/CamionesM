import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/internal/list_item.module.dart';
import 'package:flutter/material.dart';

 class NavBarItem extends ListItem{
  NavBarItems id;
  Widget page;

  NavBarItem(this.id,super.icon, super.label,this.page,{super.haveNotification=false});
}