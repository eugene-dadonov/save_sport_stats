import 'package:sport_stats_live/features/team/domain/entity/team.dart';

enum TeamListStatus {
  loading,
  success,
  empty,
  error,
}

abstract class TeamListState {}

class TeamList extends TeamListState {
  final TeamListStatus status;
  final List<Team> teams;
  final String? message;

  TeamList({
    required this.status,
    required this.teams,
    required this.message,
  });

  TeamList.loading()
      : teams = [],
        status = TeamListStatus.loading,
        message = null;

  TeamList.success(this.teams)
      : status = TeamListStatus.success,
        message = null;

  TeamList.error(this.message)
      : teams = [],
        status = TeamListStatus.error;

  TeamList.empty(this.message)
      : teams = [],
        status = TeamListStatus.empty;
}

class OpenTeam extends TeamListState {
  final String id;

  OpenTeam({required this.id});
}

class OpenTeamContextMenu extends TeamListState {
  final String id;

  OpenTeamContextMenu(this.id);
}
