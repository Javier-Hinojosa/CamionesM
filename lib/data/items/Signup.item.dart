import 'package:camionesmtransportist/core/values/enums.dart';
import 'package:get/get.dart';

class SignUpItem{
  final Rx<TypeUser> typeUser;
  final Rx<TypePerson> typePerson;

  SignUpItem({ required this.typePerson,required this.typeUser});


}