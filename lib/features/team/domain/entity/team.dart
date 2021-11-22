import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:uuid/uuid.dart';

class Team {
  String uid;
  String name;
  Sport sport;
  Logo logo;
  TeamColor teamColor;
  String city;

  Team({
    required this.uid,
    required this.name,
    required this.logo,
    required this.teamColor,
    required this.city,
    required this.sport,
  });

  Team.blank()
      : uid = const Uuid().v1(),
        name = "",
        city = "",
        teamColor = TeamColor.gunMetalGrey,
        logo = Logo.round2,
        sport = Sport.other;
}

enum HostStatus {
  host,
  guest,
}

extension TeamColorX on TeamColor {
  bool isEqual(TeamColor color) => color.index == index;
}
