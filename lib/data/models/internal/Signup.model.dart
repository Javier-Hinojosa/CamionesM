import 'package:camionesm/core/values/enums.dart';
import 'package:get/get.dart';

class SignUpModel{
  final Rx<TypeUser> typeUser;
  final Rx<TypePerson> typePerson;

  SignUpModel({ required this.typePerson,required this.typeUser});


}