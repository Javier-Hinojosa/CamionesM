import 'package:camionesm/data/models/items/list.item.dart';

class GenericItem  extends ListItem{
  Enum id;
  void Function()? onPressed;
  GenericItem(this.id,super.icon, super.label, {super.haveNotification=false, this.onPressed});


}