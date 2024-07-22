import 'package:camionesm/app/pages/signup/registers/access_data/access_data.page.dart';
import 'package:camionesm/app/pages/signup/registers/general_data/general_data.page.dart';
import 'package:camionesm/app/pages/signup/registers/legal_representative/legal_representative.page.dart';
import 'package:camionesm/app/pages/signup/registers/residence_fiscal/resicence_fiscal.page.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/data/models/internal/Signup.model.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController{

  final signUpModel= SignUpModel(
    typePerson: TypePerson.none.obs,
    typeUser: TypeUser.none.obs
  );

  @override
  void onInit() async {
    super.onInit();
  }

  onDynamicPage(String pathIcon) {
    switch(pathIcon){//register definided in paths
      case Paths.personPlus: Get.to(()=>const GeneralDataPage()); break;
      case Paths.location: Get.to(()=>const ResidenceFiscalPage()); break;
      case Paths.briefcase: Get.to(()=>const LegalRepresentativePage()); break;
      case Paths.key: Get.to(()=>const AccessDataPage()); break;
    }
  }




}