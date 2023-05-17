import 'package:flutter/material.dart';

class ColorConstants {
  static Color gray50 = hexToColor('#e9e9e9');
  static Color gray100 = hexToColor('#bdbebe');
  static Color gray200 = hexToColor('#929293');
  static Color gray300 = hexToColor('#666667');
  static Color gray400 = hexToColor('#505151');
  static Color gray450 = hexToColor('#303030');
  static Color gray500 = hexToColor('#242526');
  static Color gray550 = hexToColor('#222222');
  static Color gray600 = hexToColor('#202122');
  static Color gray700 = hexToColor('#191a1b');
  static Color gray800 = hexToColor('#121313');
  static Color gray900 = hexToColor('#0e0f0f');
  static Color green = hexToColor('#055f22');
  static Color lightGreen = hexToColor('#96ee02');
  static Color darkGrey = hexToColor('#282828');
  static Color white = hexToColor('#ffffff');
  static Color darkGreen1 = hexToColor('#004a15');
  static Color darkGreen2 = hexToColor('#017020');
  static Color darkGreen3 = hexToColor('#00952a');
  static Color darkGreen4 = hexToColor('#00ba35');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
