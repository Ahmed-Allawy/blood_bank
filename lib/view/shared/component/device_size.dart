import 'package:flutter/cupertino.dart';

class LayoutSize {
  static double? screenWidth;
  static double? screenHeight;
  static double? layoutValue;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    layoutValue =
        orientation == Orientation.landscape ? screenHeight! : screenWidth!;
  }
}
