import 'package:sport_stats_live/features/team/domain/entity/team.dart';

enum TeamListStatus {
  loading,
  success,
  empty,
  error,
}

abstract class TeamListState {}

class ListState extends TeamListState {
  final TeamListStatus status;
  final List<Team> teams;
  final String? message;

  ListState({
    required this.status,
    required this.teams,
    required this.message,
  });

  ListState.loading()
      : teams = [],
        status = TeamListStatus.loading,
        message = null;

  ListState.success(this.teams)
      : status = TeamListStatus.success,
        message = null;

  ListState.error(this.message)
      : teams = [],
        status = TeamListStatus.error;

  ListState.empty(this.message)
      : teams = [],
        status = TeamListStatus.empty;
}

class OpenTeamState extends TeamListState {
  final Team team;

  OpenTeamState({required this.team});
}

class OpenTeamContextMenuState extends TeamListState {
  final String id;

  OpenTeamContextMenuState(this.id);
}

class NewTeamState extends TeamListState {}
