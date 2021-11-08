import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class NewTeamState {}

class OnLoading extends NewTeamState {}

class OnNewTeamLoaded extends NewTeamState {
  final Team? team;

  OnNewTeamLoaded(this.team);
}

class OnTeamSaved extends NewTeamState {}
