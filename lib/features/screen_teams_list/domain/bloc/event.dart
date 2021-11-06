abstract class TeamListEvent {}

class OnStart extends TeamListEvent {}

class OnDeleteTeam extends TeamListEvent {
  final String id;

  OnDeleteTeam(this.id);
}

class OnModifyTeam extends TeamListEvent {
  final String id;

  OnModifyTeam(this.id);
}

class OnOpenTeam extends TeamListEvent {
  final String id;

  OnOpenTeam(this.id);
}
