import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> saveString(String key, String value);
  String? getString(String key);
}

@Injectable(as: StorageService)
class StorageServiceImpl implements StorageService {
  final SharedPreferences _sharedPreferences;

  StorageServiceImpl(this._sharedPreferences);

  @override
  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }
}
