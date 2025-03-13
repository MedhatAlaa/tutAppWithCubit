import 'package:new_tut_app/presentation/resources/language_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyLangPref = 'keyLangPref';
const String keyLoggedIn = 'keyLoggedIn';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(keyLangPref);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<bool> setUserLoggedIn() async {
    return await _sharedPreferences.setBool(keyLoggedIn, true);
  }

  Future<bool> isUserLogged() async {
    return _sharedPreferences.getBool(keyLoggedIn) ?? false;
  }
}
