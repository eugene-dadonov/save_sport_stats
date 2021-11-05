import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamRepository {

  void saveTeam(Team team);

  List<Team> getTeams();

  Team getTeamById(String id);
}