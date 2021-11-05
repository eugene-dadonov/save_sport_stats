import 'package:flutter/cupertino.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import 'colors_light.dart';

class AppColors {
  static const Color redDark = Color(0xFF840622);
  static const Color red = Color(0xFFD02929);
  static const Color orange = Color(0xFFF2994A);
  static const Color yellow = Color(0xFFFFD25F);
  static const Color green = Color(0xFF219653);
  static const Color greenLight = Color(0xFF11D063);
  static const Color cyan = Color(0xFF0BB7B7);
  static const Color azure = Color(0xFF578DD4);
  static const Color blue = Color(0xFF235190);
  static const Color purple = Color(0xFF9B51E0);
  static const Color raspberry = Color(0xFFB91678);
  static const Color pink = Color(0xFFEF5DA8);
  static const Color greyLight = Color(0xFFA7A7A7);
  static const Color grey = Color(0xFF5F5F5F);
  static const Color greyDark = Color(0xFF383737);
  static const Color black = Color(0xFF151515);

  static const Color background = Color(0xFFE0E8F2);
  static const Color main = Color(0xFF2F3D50);
  static const Color secondary = Color(0xFF6C89AF);
  static const Color cancel = Color(0xFF9E203C);
  static const Color ok = Color(0xFF1A7943);
  static const Color card = Color(0xFFFFFFFF);

  static Color getColorByTeamColor(TeamColor teamColor) {
    switch (teamColor) {
      case TeamColor.redDark:
        return ColorsLight.redDark;
      case TeamColor.red:
        return ColorsLight.red;
      case TeamColor.orange:
        return ColorsLight.orange;
      case TeamColor.yellow:
        return ColorsLight.yellow;
      case TeamColor.green:
        return ColorsLight.green;
      case TeamColor.greenLight:
        return ColorsLight.greenLight;
      case TeamColor.cyan:
        return ColorsLight.cyan;
      case TeamColor.azure:
        return ColorsLight.azure;
      case TeamColor.blue:
        return ColorsLight.blue;
      case TeamColor.purple:
        return ColorsLight.purple;
      case TeamColor.raspberry:
        return ColorsLight.raspberry;
      case TeamColor.pink:
        return ColorsLight.pink;
      case TeamColor.greyLight:
        return ColorsLight.greyLight;
      case TeamColor.grey:
        return ColorsLight.grey;
      case TeamColor.greyDark:
        return ColorsLight.greyDark;
      case TeamColor.black:
        return ColorsLight.black;
    }
  }
}
