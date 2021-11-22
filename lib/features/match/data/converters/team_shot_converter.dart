import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/match/data/storage/models/team_shot_model.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:collection/collection.dart';

class TeamShotConverter {
  static Team fromModel(TeamShotModel teamShotModel) {
    TeamColor? teamColor = TeamColor.values.firstWhereOrNull(
        (teamColor) => teamColor.toString() == teamShotModel.teamColor);

    Logo? logo = Logo.values
        .firstWhereOrNull((logo) => logo.toString() == teamShotModel.logo);

    Sport? sport = Sport.values
        .firstWhereOrNull((sport) => sport.toString() == teamShotModel.sport);

    return Team(
      uid: teamShotModel.id,
      name: teamShotModel.name,
      logo: logo ?? Logo.shield1,
      teamColor: teamColor ?? TeamColor.gunMetalGrey,
      city: teamShotModel.city,
      sport: sport ?? Sport.other,
    );
  }

  static TeamShotModel toModel(Team team) => TeamShotModel(
        id: team.uid,
        name: team.name,
        teamColor: team.teamColor.toString(),
        city: team.city,
        logo: team.logo.toString(),
        sport: team.sport.toString(),
      );
}
