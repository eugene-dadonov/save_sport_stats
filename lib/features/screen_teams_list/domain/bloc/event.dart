abstract class TeamListEvent {}

class Init extends TeamListEvent {}

class OpenTeamContextMenu extends TeamListEvent {
  final String id;

  OpenTeamContextMenu(this.id);
}

class OnOpenTeam extends TeamListEvent {
  final String id;

  OnOpenTeam(this.id);
}
