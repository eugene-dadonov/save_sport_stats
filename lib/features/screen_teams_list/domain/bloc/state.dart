import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamListState {}

class OnLoading extends TeamListState {}

class OnTeams extends TeamListState {
  final List<Team> teams;

  OnTeams({required this.teams});
}

class OnTeamClicked extends TeamListState {
  final String id;

  OnTeamClicked({required this.id});
}

class OnError extends TeamListState {
  final String message;

  OnError({required this.message});
}
