import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/match/data/storage/models/team_shot_model.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:collection/collection.dart';

class TeamShotConverter {
  static Team fromModel(TeamShotModel teamShotModel) {
    TeamColor? teamColor = TeamColor.values.firstWhereOrNull(
        (teamColor) => teamColor.toString() == teamShotModel.teamColor);

    return Team(
      uid: teamShotModel.id,
      name: teamShotModel.name,
      logo: Logo.round, // TODO: НЕ РАБОТАЕТ ПОКА ЧТО! ПОЧИНИТЬ СРАЗУ ПОСЛЕ ЭКРАНА С КОМАНДАМИ!
      teamColor: teamColor ?? TeamColor.grey,
      city: teamShotModel.city,
    );
  }

  static TeamShotModel toModel(Team team) => TeamShotModel(
        id: team.uid,
        name: team.name,
        teamColor: team.teamColor.toString(),
        city: team.city,
      );
}
