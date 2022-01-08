import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamRepository {
  Future<Transporter<bool>> saveTeam(Team team);

  Future<Transporter<List<Team>>> getTeams();

  Future<Transporter<Team>> getTeamById(String id);

  Future<Transporter<bool>> delete(String id);
}
