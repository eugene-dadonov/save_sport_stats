import 'dart:ui';

import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';

class Team {
  String uid;
  String name;
  Logo logo;
  TeamColor teamColor;
  String city;

  Team({
    required this.uid,
    required this.name,
    required this.logo,
    required this.teamColor,
    required this.city,
  });
}

enum HostStatus {
  host,
  guest,
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

extension TeamColorX on TeamColor {
  Color toColor() => AppColors.getColorByTeamColor(this);

  bool isEqual(TeamColor color) => color.index == index;
}