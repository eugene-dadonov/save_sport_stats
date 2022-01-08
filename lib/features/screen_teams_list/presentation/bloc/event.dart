import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamListEvent {}

class Init extends TeamListEvent {}

class OpenTeamContextMenu extends TeamListEvent {
  final String id;

  OpenTeamContextMenu(this.id);
}

class OnOpenTeam extends TeamListEvent {
  final Team team;

  OnOpenTeam(this.team);
}

class OnNewTeam extends TeamListEvent {}
