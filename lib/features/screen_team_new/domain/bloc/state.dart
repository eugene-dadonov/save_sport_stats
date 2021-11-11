import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamEditState {}

class LoadingState extends TeamEditState {}

class TeamState extends TeamEditState {
  final Team team;
  final bool isNewTeam;

  TeamState({
    required this.team,
    required this.isNewTeam,
  });
}

class TeamSavedState extends TeamEditState {}
