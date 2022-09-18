import 'package:flutter_app/presentation/resources/language_manager/language_type.dart';
import 'package:flutter_app/presentation/resources/language_manager/language_type_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "prefsKeyLang";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }
}
