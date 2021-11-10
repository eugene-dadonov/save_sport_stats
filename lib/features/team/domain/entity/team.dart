import 'dart:ui';

import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:uuid/uuid.dart';

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

  Team.blank()
      : uid = const Uuid().v1(),
        name = "",
        city = "",
        teamColor = TeamColor.black,
        logo = Logo.round;
}

enum HostStatus {
  host,
  guest,
}

extension TeamColorX on TeamColor {
  bool isEqual(TeamColor color) => color.index == index;
}
