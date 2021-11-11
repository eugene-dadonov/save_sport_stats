import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamsEvent {}

class Teams extends TeamsEvent {}

class NewTeam extends TeamsEvent {
  final Team newTeam;

  NewTeam(this.newTeam);
}

class UpdateTeam extends TeamsEvent {
  final Team updatedTeam;

  UpdateTeam({required this.updatedTeam});
}

class DeleteTeam extends TeamsEvent {
  final String id;

  DeleteTeam({required this.id});
}
