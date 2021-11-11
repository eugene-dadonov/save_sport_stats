import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamStorage {
  Future<Team> getTeam(String id);

  Future<void> saveTeam(Team team);

  Future<List<Team>> getTeams();

  deleteTeam(String id);
}
