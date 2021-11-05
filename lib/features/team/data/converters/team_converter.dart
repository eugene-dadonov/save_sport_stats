import 'package:sport_stats_live/features/match/data/storage/models/team_shot_model.dart';
import 'package:sport_stats_live/features/team/data/model/team_model.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:collection/collection.dart';

class TeamConverter {
  static Team fromModel(TeamShotModel teamModel) {
    TeamColor? teamColor = TeamColor.values.firstWhereOrNull(
            (teamColor) => teamColor.toString() == teamModel.teamColor);

    return Team(
      uid: teamModel.id,
      name: teamModel.name,
      teamColor: teamColor ?? TeamColor.grey,
      city: teamModel.city,
    );
  }

  static TeamModel toModel(Team team) =>
      TeamModel(
        id: team.uid,
        name: team.name,
        teamColor: team.teamColor.toString(),
        city: team.city,
      );
}
