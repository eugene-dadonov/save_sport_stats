import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  TextStyle h1({Color? color});

  TextStyle h2({Color? color});

  TextStyle h3({Color? color});

  TextStyle h4({Color? color});

  TextStyle b1({Color? color});

  TextStyle b2({Color? color});

  TextStyle t1({Color? color});

  TextStyle t2({Color? color});

  TextStyle table({Color? color});

  TextStyle attribute({Color? color});
}

class Exo2TextStyles implements AppTextStyle {
  @override
  TextStyle h1({Color? color}) => GoogleFonts.exo2(
      color: color,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      textBaseline: TextBaseline.alphabetic);

  @override
  TextStyle h2({Color? color}) => GoogleFonts.exo2(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle h3({Color? color}) => GoogleFonts.exo2(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle h4({Color? color}) => GoogleFonts.exo2(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle b1({Color? color}) => GoogleFonts.exo2(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle b2({Color? color}) => GoogleFonts.exo2(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle t1({Color? color}) => GoogleFonts.exo2(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle t2({Color? color}) => GoogleFonts.exo(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle table({Color? color}) => GoogleFonts.ubuntuMono(
        color: color,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle attribute({Color? color}) => GoogleFonts.ubuntuMono(
    color: color,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
}
