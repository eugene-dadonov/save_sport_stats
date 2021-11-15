import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:uuid/uuid.dart';

class TeamGenerator {
  static List<Team> generateTeams() {
    return [
      Team(
        uid: const Uuid().v1(),
        name: "FC Zenit",
        logo: Logo.triangle4,
        teamColor: TeamColor.cyan,
        city: "Saint-Petersburg",
        sport: Sport.volleyball,
      ),
      Team(
          uid: const Uuid().v1(),
          name: "FC Juventus",
          logo: Logo.oval,
          teamColor: TeamColor.gunMetalGrey,
          sport: Sport.volleyball,
          city: "Milan"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Chelsea",
          logo: Logo.round3,
          teamColor: TeamColor.blue,
          sport: Sport.rugby,
          city: "London"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Manchester City",
          logo: Logo.rombus2,
          teamColor: TeamColor.azure,
          sport: Sport.volleyball,
          city: "Manchester"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Atletico Madrid",
          logo: Logo.shield3,
          teamColor: TeamColor.red,
          sport: Sport.basketball,
          city: "Madrid"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Borussia Dortmund",
          logo: Logo.round1,
          teamColor: TeamColor.yellow,
          sport: Sport.baseball,
          city: "Dortmund"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Manchester United",
          logo: Logo.square,
          sport: Sport.cricket,
          teamColor: TeamColor.yellow,
          city: "Manchester"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Bavaria",
          logo: Logo.round1,
          teamColor: TeamColor.redDark,
          sport: Sport.cricket,
          city: "Bavaria"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Sporting",
          logo: Logo.shield1,
          teamColor: TeamColor.greenLight,
          sport: Sport.football,
          city: "Lissabon"),
    ];
  }
}
