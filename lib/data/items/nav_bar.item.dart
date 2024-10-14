import 'package:camionesmtransportist/core/values/enums.dart';
import 'package:camionesmtransportist/data/models/items/list.item.dart';
import 'package:flutter/material.dart';

 class NavBarItem extends ListItem{
  NavBarItems id;
  Widget page;

  NavBarItem(this.id,super.icon, super.label,this.page,{super.haveNotification=false});
}