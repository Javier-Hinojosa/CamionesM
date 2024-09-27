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
  String token = '';


  bool get isLogged => token.isNotEmpty;


  // Métodos para actualizar los datos
  void updateUser(String token) {
    this.token = token;
  }
}
