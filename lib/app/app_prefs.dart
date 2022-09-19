import 'package:flutter_app/presentation/resources/language_manager/language_type.dart';
import 'package:flutter_app/presentation/resources/language_manager/language_type_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyOnboardingScreenViewed = "prefsKeyOnboardingScreenViewed ";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";

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

  // onboarding set and get functions
  Future<void> setOnboardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnboardingScreenViewed, true);
  }

  Future<bool> isOnboardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingScreenViewed) ?? false;
  }

  // login set and get functions
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }
}
