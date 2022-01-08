import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamEditState {}

class LoadingState extends TeamEditState {}

class TeamState extends TeamEditState {
  final Team team;
  final String? title;

  TeamState({
    required this.team,
    required this.title,
  });
}

class TeamSavedState extends TeamEditState {}
