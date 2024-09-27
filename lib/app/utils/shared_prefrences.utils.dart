import 'package:shared_preferences/shared_preferences.dart';

class SharedUtilsPriority<T> implements CustomShared<T>  {
  late final SharedPreferencesWithCache _prefsWithCache;

  // Constructor privado
  SharedUtilsPriority._(this._prefsWithCache);

  // Método factory asíncrono para crear una instancia
  static Future<SharedUtilsPriority<T>> create<T>() async {
    final prefsWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{
          //put important keys
        }));
    return SharedUtilsPriority._(prefsWithCache);
  }

  @override
  Future<void> setValue(String key, T value) async {
    // Mapa de tipos a funciones de almacenamiento
    final setters = {
      String: () => _prefsWithCache.setString(key, value as String),
      int: () => _prefsWithCache.setInt(key, value as int),
      double: () => _prefsWithCache.setDouble(key, value as double),
      bool: () => _prefsWithCache.setBool(key, value as bool),
    };

    var setter = setters[T];
    if (setter != null) {
      await setter();
    } else {
      throw UnsupportedError('Tipo de valor no soportado: ${T.runtimeType}');
    }
  }

  @override
  T? getValue(String key) {
    // Mapa de tipos a funciones de obtención de datos
    final getters = {
      String: () => _prefsWithCache.getString(key),
      int: () => _prefsWithCache.getInt(key),
      double: () => _prefsWithCache.getDouble(key),
      bool: () => _prefsWithCache.getBool(key),
    };

    var getter = getters[T];
    if (getter != null) {
      return getter() as T?;
    } else {
      throw UnsupportedError('Tipo de valor no soportado: ${T.runtimeType}');
    }
  }

  @override
  Future<void>  clearValue(String key){
   return _prefsWithCache.remove(key);
  }

  @override
  Future<void>  clearAll(){
    return  _prefsWithCache.clear();
  }

}

class SharedUtils<T> implements CustomShared<T> {
  late final SharedPreferences _prefs;

  // Constructor privado
  SharedUtils._(this._prefs);

  // Método factory asíncrono para crear una instancia
  static Future<SharedUtils<T>> create<T>() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedUtils._(prefs);
  }

  @override
  Future<void> setValue(String key, T value) async {
    // Mapa de tipos a funciones de almacenamiento
    final Map<Type, Future Function()> setters = {
      String: () => _prefs.setString(key, value as String),
      int: () => _prefs.setInt(key, value as int),
      double: () => _prefs.setDouble(key, value as double),
      bool: () => _prefs.setBool(key, value as bool)
    };

    var setter = setters[T];
    if (setter != null) {
      return await setter();
    } else {
      throw UnsupportedError('Tipo de valor no soportado: ${T.runtimeType}');
    }
  }

  @override
  T? getValue(String key) {
    // Mapa de tipos a funciones de obtención de datos
    final getters = {
      String: () => _prefs.getString(key),
      int: () => _prefs.getInt(key),
      double: () => _prefs.getDouble(key),
      bool: () => _prefs.getBool(key),
    };

    var getter = getters[T];
    if (getter != null) {
      return getter() as T?;
    } else {
      throw UnsupportedError('Tipo de valor no soportado: ${T.runtimeType}');
    }
  }

  @override
  Future<void> clearValue(String key) {
    return _prefs.remove(key);
  }

  @override
  Future<void> clearAll() {
    return _prefs.clear();
  }
}

abstract class CustomShared<T>{
  Future<void> setValue(String key, T value);
  T? getValue(String key);
  Future<void>  clearValue(String key);
  Future<void>  clearAll();
}