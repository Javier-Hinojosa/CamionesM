import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/internal/list_item.module.dart';

class ProfileItem  extends ListItem{
  ProfileItems id;
  ProfileItem(this.id,super.icon, super.label, {super.haveNotification=false});


}