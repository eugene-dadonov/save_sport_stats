import 'package:equatable/equatable.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:uuid/uuid.dart';

class Team extends Equatable {
  final String uid;
  final String name;
  final Sport sport;
  final Logo logo;
  final TeamColor teamColor;
  final String city;

  const Team({
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

  Team copyWith({
    String? name,
    Logo? logo,
    TeamColor? teamColor,
    String? city,
    Sport? sport,
  }) {
    return Team(
      uid: uid,
      name: name ?? this.name,
      city: city ?? this.city,
      sport: sport ?? this.sport,
      logo: logo ?? this.logo,
      teamColor: teamColor ?? this.teamColor,
    );
  }

  @override
  List<Object?> get props => [uid, name, logo, teamColor, city, sport];
}

enum HostStatus {
  host,
  guest,
}

extension TeamColorX on TeamColor {
  bool isEqual(TeamColor color) => color.index == index;
}
