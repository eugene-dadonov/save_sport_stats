import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class NewTeamState {}

class OnLoading extends NewTeamState {}

class OnTeamUpdated extends NewTeamState {
  final Team? team;

  OnTeamUpdated(this.team);
}

class OnTeamSaved extends NewTeamState {}
