import 'package:sport_stats_live/features/match/data/storage/models/team_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/team.dart';
import 'package:collection/collection.dart';

class TeamConverter {
  static Team fromModel(TeamModel teamModel) {
    TeamColor? teamColor = TeamColor.values.firstWhereOrNull(
        (teamColor) => teamColor.toString() == teamModel.teamColor);

    return Team(
      name: teamModel.name,
      teamColor: teamColor ?? TeamColor.grey,
      city: teamModel.city,
    );
  }

  static TeamModel toModel(Team team) => TeamModel(
        name: team.name,
        teamColor: team.teamColor.toString(),
        city: team.city,
      );
}
