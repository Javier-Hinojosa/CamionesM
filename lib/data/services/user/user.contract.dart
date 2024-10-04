import 'dart:async';

import 'package:camionesm/data/models/models/auth.model.dart';

abstract class IUserService {
  Future<AuthModel> auth(String name, String pass);
  Future<AuthModel> refresh(String tokenRefresh);
}