import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamRepository {

  Future<void> saveTeam(Team team);

  Future<List<Team>> getTeams();

  Future<Team> getTeamById(String id);
}