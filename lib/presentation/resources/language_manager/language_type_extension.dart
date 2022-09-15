// ignore_for_file: constant_identifier_names
import 'package:flutter_app/presentation/resources/language_manager/language_type.dart';

const String ARABIC = 'ar';
const String ENGLISH = 'en';

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
      default:
        return ENGLISH;
    }
  }
}
