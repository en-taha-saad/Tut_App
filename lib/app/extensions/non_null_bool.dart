import 'package:flutter_app/app/constants.dart';

extension NonNullBoolean on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.falseVal;
    } else {
      return this!;
    }
  }
}
