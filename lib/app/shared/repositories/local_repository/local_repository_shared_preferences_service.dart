import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepositorySharedPreferencesService extends Disposable {
  static SharedPreferences _preferences = Modular.get<SharedPreferences>();
  static LocalRepositorySharedPreferencesService? _service;
  static const String ISAUTOSYNCKEY = 'autosync';

  LocalRepositorySharedPreferencesService._();

  static LocalRepositorySharedPreferencesService get instance {
    if (_service == null) {
      _service = LocalRepositorySharedPreferencesService._();
    }
    return _service!;
  }

  Future<bool> setAutoSync({bool isAuto = false}) async {
    await _preferences.setBool(ISAUTOSYNCKEY, isAuto);
    return isAuto;
  }

  Future<bool> getAutoSync() async {
    return _preferences.getBool(ISAUTOSYNCKEY) ?? false;
  }

  @override
  void dispose() {}
}
