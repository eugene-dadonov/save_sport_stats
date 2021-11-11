import 'package:sport_stats_live/features/team/data/storage/hive_team_storage.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class TeamRepositoryImpl extends TeamRepository {
  final HiveTeamStorage teamStorage;

  TeamRepositoryImpl({required this.teamStorage});

  @override
  Future<Team> getTeamById(String id) async => await teamStorage.getTeam(id);

  @override
  Future<List<Team>> getTeams() async => await teamStorage.getTeams();

  @override
  Future<void> saveTeam(Team team) async => await teamStorage.saveTeam(team);

  @override
  void delete(String id) => teamStorage.deleteTeam(id);
}
