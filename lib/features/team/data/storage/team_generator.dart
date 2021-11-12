import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
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
          city: "Saint-Petersburg"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Juventus",
          logo: Logo.oval,
          teamColor: TeamColor.black,
          city: "Milan"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Chelsea",
          logo: Logo.round3,
          teamColor: TeamColor.blue,
          city: "London"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Manchester City",
          logo: Logo.rombus2,
          teamColor: TeamColor.azure,
          city: "Manchester"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Atletico Madrid",
          logo: Logo.shield3,
          teamColor: TeamColor.red,
          city: "Madrid"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Borussia Dortmund",
          logo: Logo.round1,
          teamColor: TeamColor.yellow,
          city: "Dortmund"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Manchester United",
          logo: Logo.square,
          teamColor: TeamColor.yellow,
          city: "Manchester"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Bavaria",
          logo: Logo.round1,
          teamColor: TeamColor.redDark,
          city: "Bavaria"),
      Team(
          uid: const Uuid().v1(),
          name: "FC Sporting",
          logo: Logo.shield1,
          teamColor: TeamColor.greenLight,
          city: "Lissabon"),
    ];
  }
}
