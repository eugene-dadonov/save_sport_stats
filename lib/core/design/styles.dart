import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppStyle {
  static TextStyle h1({Color color = AppColors.main, double size = 14}) =>
      GoogleFonts.russoOne(color: color, fontSize: size);
}