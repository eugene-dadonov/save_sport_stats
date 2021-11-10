import 'dart:ui';

import 'package:sport_stats_live/core/theming/data/colors/team_colors/dark_team_colors.dart';
import 'package:sport_stats_live/core/theming/data/colors/team_colors/light_team_colors.dart';
import 'package:sport_stats_live/core/theming/data/themes/themes.dart';

class AppThemeData {
  final AppTheme themeData;
  final bool isDark;
  final TeamsColors teamsColor;
  final Color main;
  final Color background1;
  final Color secondary1;
  final Color secondary2;
  final Color ok;
  final Color cancel;
  final Color card;
  final Color cardShadow;

  AppThemeData.darkBase({
    required this.themeData,
    required this.main,
    required this.background1,
    required this.secondary1,
    required this.secondary2,
    required this.ok,
    required this.cancel,
    required this.card,
    required this.cardShadow,
  })  : isDark = true,
        teamsColor = TeamsColors.dark();

  AppThemeData.lightBase({
    required this.themeData,
    required this.main,
    required this.background1,
    required this.secondary1,
    required this.secondary2,
    required this.ok,
    required this.cancel,
    required this.card,
    required this.cardShadow,
  })  : isDark = false,
        teamsColor = TeamsColors.light();

  Color fromTeamColor(TeamColor teamColor) {
    switch (teamColor) {
      case TeamColor.redDark:
        return teamsColor.redDark;
      case TeamColor.red:
        return teamsColor.red;
      case TeamColor.orange:
        return teamsColor.orange;
      case TeamColor.yellow:
        return teamsColor.yellow;
      case TeamColor.green:
        return teamsColor.green;
      case TeamColor.greenLight:
        return teamsColor.greenLight;
      case TeamColor.cyan:
        return teamsColor.cyan;
      case TeamColor.azure:
        return teamsColor.azure;
      case TeamColor.blue:
        return teamsColor.blue;
      case TeamColor.purple:
        return teamsColor.purple;
      case TeamColor.raspberry:
        return teamsColor.raspberry;
      case TeamColor.pink:
        return teamsColor.pink;
      case TeamColor.greyLight:
        return teamsColor.greyLight;
      case TeamColor.grey:
        return teamsColor.grey;
      case TeamColor.greyDark:
        return teamsColor.greyDark;
      case TeamColor.black:
        return teamsColor.black;
    }
  }
}

class TeamsColors {
  Color redDark;
  Color red;
  Color orange;
  Color yellow;
  Color green;
  Color greenLight;
  Color cyan;
  Color azure;
  Color blue;
  Color purple;
  Color raspberry;
  Color pink;
  Color greyLight;
  Color grey;
  Color greyDark;
  Color black;

  TeamsColors.dark()
      : redDark = DarkTeamColors.redDark,
        red = DarkTeamColors.red,
        orange = DarkTeamColors.orange,
        yellow = DarkTeamColors.yellow,
        greenLight = DarkTeamColors.greenLight,
        green = DarkTeamColors.green,
        cyan = DarkTeamColors.cyan,
        azure = DarkTeamColors.azure,
        blue = DarkTeamColors.blue,
        purple = DarkTeamColors.purple,
        raspberry = DarkTeamColors.raspberry,
        pink = DarkTeamColors.pink,
        greyLight = DarkTeamColors.greyLight,
        grey = DarkTeamColors.grey,
        greyDark = DarkTeamColors.greyDark,
        black = DarkTeamColors.black;

  TeamsColors.light()
      : redDark = LightTeamColors.redDark,
        red = LightTeamColors.red,
        orange = LightTeamColors.orange,
        yellow = LightTeamColors.yellow,
        greenLight = LightTeamColors.greenLight,
        green = LightTeamColors.green,
        cyan = LightTeamColors.cyan,
        azure = LightTeamColors.azure,
        blue = LightTeamColors.blue,
        purple = LightTeamColors.purple,
        raspberry = LightTeamColors.raspberry,
        pink = LightTeamColors.pink,
        greyLight = LightTeamColors.greyLight,
        grey = LightTeamColors.grey,
        greyDark = LightTeamColors.greyDark,
        black = LightTeamColors.black;
}

enum TeamColor {
  redDark,
  red,
  orange,
  yellow,
  green,
  greenLight,
  cyan,
  azure,
  blue,
  purple,
  raspberry,
  pink,
  greyLight,
  grey,
  greyDark,
  black,
}
