import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class NewTeamEvent {}

class Start extends NewTeamEvent {
  final Team? team;

  Start(this.team);
}

class UpdateName extends NewTeamEvent {
  final String name;

  UpdateName(this.name);
}

class UpdateCity extends NewTeamEvent {
  final String city;

  UpdateCity(this.city);
}

class UpdateColor extends NewTeamEvent {
  final TeamColor color;

  UpdateColor(this.color);
}

class UpdateLogo extends NewTeamEvent {
  final Logo logo;

  UpdateLogo(this.logo);
}

class SaveTeam extends NewTeamEvent {}
