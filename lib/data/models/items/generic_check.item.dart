import 'package:camionesm/data/models/items/check.item.dart';
import 'package:flutter/cupertino.dart';

class GenericCheck extends CheckItem{
  Enum id;
  IconData? icon;
  GenericCheck(this.id,super.title,{this.icon,super.isSelect});

}