import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0XFF45237A);
  static Color white = const Color(0XFFFFFFFF);
  static Color bgWhite = const Color(0XFFEFEFFF);
  static const Map<int, Color> primarySwatch = {
    50: Color(0XFFE9E4F1),
    100: Color(0XFFB8A5D4),
    200: Color(0XFF9070C2),
    300: Color(0XFF6E43B1),
    400: Color(0XFF5B3399),
    500: Color(0XFF45237A),
    600: Color(0XFF3A1C69),
    700: Color(0XFF31165A),
    800: Color(0XFF28114A),
    900: Color(0XFF1F0D3B)
  };

  static const Map<int, Color> primaryAccent = {
    100: Color(0XFFC7A3FF),
    200: Color(0XFFA870FF),
    400: Color(0XFF731AFF),
    700: Color(0XFF5A00E6),
  };

  static Color textLight = const Color(0XFFFFFFFF);
}
