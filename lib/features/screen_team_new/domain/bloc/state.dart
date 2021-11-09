import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamEditState {}

class LoadingState extends TeamEditState {}

class TeamState extends TeamEditState {
  final Team team;

  TeamState(this.team);
}

class TeamSavedState extends TeamEditState {}
