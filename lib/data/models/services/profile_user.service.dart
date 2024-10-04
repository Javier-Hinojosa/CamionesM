import 'package:camionesm/data/models/models/auth.model.dart';

class ProfileUserService {
  // Singleton: la única instancia de la clase
  static final ProfileUserService _instance = ProfileUserService._internal();

  // Constructor privado
  ProfileUserService._internal();

  // Factory constructor para devolver la instancia existente
  factory ProfileUserService() {
    return _instance;
  }

  // Variables que deseas almacenar temporalmente
  AuthUserModel userModel = AuthUserModel(0,false,"","","",false);

  bool get isLogged => userModel.username.isNotEmpty;


  // Métodos para actualizar los datos
  void updateUser(AuthUserModel userModel) {
    this.userModel = userModel;
  }
}
