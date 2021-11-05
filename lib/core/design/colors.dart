import 'package:flutter/cupertino.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class AppColors {
  // Todo: переделать все цвета!
  static const Color background = Color(0xFFE0E8F2);
  static const Color backgroundDark = Color(0xFF6C89AF);

  static const Color red = Color(0xFF9E203C);
  static const Color green = Color(0xFF3A7D0E);
  static const Color lightGreen = Color(0xFF71B641);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF686868);
  static const Color yellow = Color(0xFFBB890C);
  static const Color blue = Color(0xFF1B5BCD);
  static const Color blueLight = Color(0xFF457CDE);
  static const Color blueDark = Color(0xFF2F3D50);
  static const Color orange = Color(0xFFA75D0D);
  static const Color purple = Color(0xFF5D0F87);
  static const Color pink = Color(0xFF880992);

  static const List<Color> teamColors = [
    red,
    blue,
    blueDark,
    green,
    yellow,
    orange,
    black,
  ];

  static Color getColorByTeamColor(TeamColor teamColor) {
    if (teamColor == TeamColor.red) {
      return red;
    } else if (teamColor == TeamColor.orange) {
      return orange;
    } else if (teamColor == TeamColor.yellow) {
      return yellow;
    } else if (teamColor == TeamColor.grey) {
      return grey;
    } else if (teamColor == TeamColor.green) {
      return green;
    } else if (teamColor == TeamColor.lightBlue) {
      return blueLight;
    } else if (teamColor == TeamColor.darkBlue) {
      return blueDark;
    } else if (teamColor == TeamColor.blue) {
      return blue;
    } else if (teamColor == TeamColor.lightGreen) {
      return lightGreen;
    } else if (teamColor == TeamColor.black) {
      return black;
    } else if (teamColor == TeamColor.pink) {
      return pink;
    } else if (teamColor == TeamColor.purple) {
      return purple;
    } else {
      return black;
    }
  }
}
