import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/list.item.dart';

class ProfileItem  extends ListItem{
  ProfileItems id;
  void Function()? onPressed;
  ProfileItem(this.id,super.icon, super.label, {super.haveNotification=false, this.onPressed});


}