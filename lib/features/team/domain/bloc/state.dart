import 'package:sport_stats_live/features/team/domain/entity/team.dart';

enum TeamsStatus {
  loading,
  success,
  empty,
  failed,
  error,
}

class TeamsState {
  final TeamsStatus teamsStatus;
  final List<Team> teams;
  final String? message;

  TeamsState({
    required this.teamsStatus,
    required this.teams,
    required this.message,
  });

  TeamsState.loading()
      : teamsStatus = TeamsStatus.loading,
        teams = [],
        message = null;

  TeamsState.empty({this.message})
      : teamsStatus = TeamsStatus.empty,
        teams = [];

  TeamsState.success({required this.teams})
      : teamsStatus = TeamsStatus.success,
        message = null;

  TeamsState.failed({this.message})
      : teams = [],
        teamsStatus = TeamsStatus.failed;

  TeamsState.error({this.message})
      : teams = [],
        teamsStatus = TeamsStatus.error;
}
