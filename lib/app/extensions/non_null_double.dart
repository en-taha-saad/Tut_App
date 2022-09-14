import 'package:flutter_app/app/constants.dart';

extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return Constants.zeroDouble;
    } else {
      return this!;
    }
  }
}
