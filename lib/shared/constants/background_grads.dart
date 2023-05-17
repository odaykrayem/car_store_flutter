import 'package:flutter/material.dart';

import 'ColorConstants.dart';

class BackGroundGradient {
  static LinearGradient splashBg = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.darkGreen1,
        ColorConstants.darkGreen2,
        ColorConstants.darkGreen3,
        ColorConstants.darkGreen4,
        Colors.white,
      ]);

  static List<Color> colors = [
    ColorConstants.darkGreen1,
    ColorConstants.darkGreen2,
    ColorConstants.darkGreen3,
    ColorConstants.darkGreen4,
    // Colors.white,
  ];
}
