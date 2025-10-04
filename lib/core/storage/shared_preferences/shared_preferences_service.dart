import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> get _instance async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<int?> getInt(String key) async {
    return await _instance.then((instance) => instance.getInt(key));
  }

  Future<bool> setInt(String key, int value) async {
    return await _instance.then((instance) => instance.setInt(key, value));
  }
}
