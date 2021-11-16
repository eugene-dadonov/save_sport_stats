import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/team/data/model/team_model.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:collection/collection.dart';

class TeamConverter {
  static Team fromModel(TeamModel teamModel) {
    TeamColor? teamColor = TeamColor.values.firstWhereOrNull(
        (teamColor) => teamColor.toString() == teamModel.teamColor);

    Logo? logo = Logo.values
        .firstWhereOrNull((teamLogo) => teamLogo.toString() == teamModel.logo);

    Sport? sport = Sport.values
        .firstWhereOrNull((sport) => sport.toString() == teamModel.sport);

    return Team(
      uid: teamModel.id,
      name: teamModel.name,
      logo: logo ?? Logo.shield1,
      teamColor: teamColor ?? TeamColor.gunMetalGrey,
      city: teamModel.city,
      sport: sport ?? Sport.unknown,
    );
  }

  static TeamModel toModel(Team team) => TeamModel(
        id: team.uid,
        name: team.name,
        logo: team.logo.toString(),
        teamColor: team.teamColor.toString(),
        city: team.city,
        sport: team.sport.toString(),
      );
}
