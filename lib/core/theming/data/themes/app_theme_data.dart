import 'dart:ui';
import 'dart:ui';

import 'package:sport_stats_live/core/theming/data/colors/team_colors/dark_team_colors.dart';
import 'package:sport_stats_live/core/theming/data/colors/team_colors/dark_team_colors_updated.dart';
import 'package:sport_stats_live/core/theming/data/colors/team_colors/light_team_colors.dart';
import 'package:sport_stats_live/core/theming/data/colors/team_colors/light_team_colors_updated.dart';
import 'package:sport_stats_live/core/theming/data/styles/text_styles.dart';
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
  final Color warning;
  final Color attention;
  final Color card;
  final Color cardShadow;
  final AppTextStyle textStyle;

  AppThemeData.darkBase({
    required this.themeData,
    required this.main,
    required this.background1,
    required this.secondary1,
    required this.secondary2,
    required this.ok,
    required this.warning,
    required this.attention,
    required this.card,
    required this.cardShadow,
    required this.textStyle,
  })  : isDark = true,
        teamsColor = TeamsColors.dark();

  AppThemeData.lightBase({
    required this.themeData,
    required this.main,
    required this.background1,
    required this.secondary1,
    required this.secondary2,
    required this.ok,
    required this.warning,
    required this.attention,
    required this.card,
    required this.cardShadow,
    required this.textStyle,
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
      case TeamColor.citron:
        return teamsColor.citron;
      case TeamColor.green:
        return teamsColor.green;
      case TeamColor.greenLight:
        return teamsColor.greenLight;
      case TeamColor.greenLime:
        return teamsColor.greenLime;
      case TeamColor.aquamarine:
        return teamsColor.aquamarine;
      case TeamColor.cyan:
        return teamsColor.cyan;
      case TeamColor.darkBlue:
        return teamsColor.darkBlue;
      case TeamColor.blue:
        return teamsColor.blue;
      case TeamColor.blueGrey:
        return teamsColor.blueGrey;
      case TeamColor.azure:
        return teamsColor.azure;
      case TeamColor.peacockBlue:
        return teamsColor.peacockBlue;
      case TeamColor.purple:
        return teamsColor.purple;
      case TeamColor.raspberry:
        return teamsColor.raspberry;
      case TeamColor.redRose:
        return teamsColor.redRose;
      case TeamColor.pink:
        return teamsColor.pink;
      case TeamColor.softPick:
        return teamsColor.softPick;
      case TeamColor.roseDusty:
        return teamsColor.roseDusty;
      case TeamColor.lightBrown:
        return teamsColor.lightBrown;
      case TeamColor.metallic:
        return teamsColor.metallic;
      case TeamColor.darkSlate:
        return teamsColor.darkSlate;
      case TeamColor.gunMetalGrey:
        return teamsColor.gunMetalGrey;
    }
  }

  Color cardForegroundColor(TeamColor teamColor) {
    if (isDark) {
      return _foregroundColorForDarkTheme(teamColor);
    } else {
      return _foregroundColorForLightTheme(teamColor);
    }
  }

  Color _foregroundColorForDarkTheme(TeamColor teamColor) {
    if (tooDarkColors.contains(teamColor)) {
      return main;
    } else {
      return card;
    }
  }

  Color _foregroundColorForLightTheme(TeamColor teamColor) {
    if (tooLightColors.contains(teamColor)) {
      return main;
    } else {
      return card;
    }
  }

  final tooDarkColors = [
    TeamColor.gunMetalGrey,
    TeamColor.darkSlate,
    TeamColor.darkBlue,
  ];

  final tooLightColors = [
    TeamColor.metallic,
    TeamColor.citron,
    TeamColor.aquamarine,
    TeamColor.yellow,
    TeamColor.blueGrey,
    TeamColor.greenLime,
  ];
}

class TeamsColors {
  Color redDark;
  Color red;
  Color orange;
  Color yellow;
  Color citron;

  //
  Color green;
  Color greenLight;
  Color greenLime;
  Color aquamarine;
  Color cyan;

  //
  Color darkBlue;
  Color blue;
  Color blueGrey;
  Color azure;
  Color peacockBlue;

  //
  Color purple;
  Color raspberry;
  Color redRose;
  Color pink;
  Color softPick;

  //
  Color roseDusty;
  Color lightBrown;
  Color metallic;
  Color darkSlate;
  Color gunMetalGrey;

  TeamsColors.dark()
      : redDark = DarkTeamColorsUpdated.redDark,
        red = DarkTeamColorsUpdated.red,
        orange = DarkTeamColorsUpdated.orange,
        yellow = DarkTeamColorsUpdated.yellow,
        citron = DarkTeamColorsUpdated.citron,
        //
        green = DarkTeamColorsUpdated.green,
        greenLight = DarkTeamColorsUpdated.greenLight,
        greenLime = DarkTeamColorsUpdated.greenLime,
        aquamarine = DarkTeamColorsUpdated.aquamarine,
        cyan = DarkTeamColorsUpdated.cyan,
        //
        darkBlue = DarkTeamColorsUpdated.darkBlue,
        blue = DarkTeamColorsUpdated.blue,
        azure = DarkTeamColorsUpdated.azure,
        blueGrey = DarkTeamColorsUpdated.blueGrey,
        peacockBlue = DarkTeamColorsUpdated.peacockBlue,
        //
        purple = DarkTeamColorsUpdated.purple,
        raspberry = DarkTeamColorsUpdated.raspberry,
        redRose = DarkTeamColorsUpdated.redRose,
        pink = DarkTeamColorsUpdated.pink,
        softPick = DarkTeamColorsUpdated.softPick,
        //
        roseDusty = DarkTeamColorsUpdated.redRose,
        lightBrown = DarkTeamColorsUpdated.lightBrown,
        metallic = DarkTeamColorsUpdated.metallic,
        darkSlate = DarkTeamColorsUpdated.darkSlate,
        gunMetalGrey = DarkTeamColorsUpdated.gunMetalGrey;

  TeamsColors.light()
      : redDark = LightTeamColorsUpdated.redDark,
        red = LightTeamColorsUpdated.red,
        orange = LightTeamColorsUpdated.orange,
        yellow = LightTeamColorsUpdated.yellow,
        citron = LightTeamColorsUpdated.citron,
        //
        green = LightTeamColorsUpdated.green,
        greenLight = LightTeamColorsUpdated.greenLight,
        greenLime = LightTeamColorsUpdated.greenLime,
        aquamarine = LightTeamColorsUpdated.aquamarine,
        cyan = LightTeamColorsUpdated.cyan,
        //
        darkBlue = LightTeamColorsUpdated.darkBlue,
        blue = LightTeamColorsUpdated.blue,
        azure = LightTeamColorsUpdated.azure,
        blueGrey = LightTeamColorsUpdated.blueGrey,
        peacockBlue = LightTeamColorsUpdated.peacockBlue,
        //
        purple = LightTeamColorsUpdated.purple,
        raspberry = LightTeamColorsUpdated.raspberry,
        redRose = LightTeamColorsUpdated.redRose,
        pink = LightTeamColorsUpdated.pink,
        softPick = LightTeamColorsUpdated.softPick,
        //
        roseDusty = LightTeamColorsUpdated.redRose,
        lightBrown = LightTeamColorsUpdated.lightBrown,
        metallic = LightTeamColorsUpdated.metallic,
        darkSlate = LightTeamColorsUpdated.darkSlate,
        gunMetalGrey = LightTeamColorsUpdated.gunMetalGrey;
}

enum TeamColor {
  redDark,
  red,
  orange,
  yellow,
  citron,
  //
  green,
  greenLight,
  greenLime,
  aquamarine,
  cyan,
  //
  darkBlue,
  blue,
  blueGrey,
  azure,
  peacockBlue,
  //
  purple,
  raspberry,
  redRose,
  pink,
  softPick,
  //
  roseDusty,
  lightBrown,
  metallic,
  darkSlate,
  gunMetalGrey,
}
