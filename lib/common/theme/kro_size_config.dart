import 'dart:math';

class SizeConfig {
  static double pxToWidth(double widthPx) {
    return widthPx * 1;
  }

  static double pxToHeight(double heightPx) {
    return heightPx * 1;
  }

  static double radius(double radius) {
    return radius * min(1, 1);
  }

  static double pxToTextSize(double sizePx) {
    return sizePx * 1;
  }
}

extension PxToLineHeight on double {
  double toLineHeight(double fontSize) {
    return SizeConfig.pxToTextSize(this) / SizeConfig.pxToTextSize(fontSize);
  }
}
