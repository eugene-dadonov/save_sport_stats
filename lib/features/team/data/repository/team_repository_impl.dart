import 'package:sport_stats_live/features/team/data/storage/hive_team_storage.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class TeamRepositoryImpl extends TeamRepository {
  final HiveTeamStorage matchStorage;

  TeamRepositoryImpl({required this.matchStorage});

  @override
  Future<Team> getTeamById(String id) async => await matchStorage.getTeam(id);

  @override
  Future<List<Team>> getTeams() async => await matchStorage.getTeams();

  @override
  Future<void> saveTeam(Team team) async => await matchStorage.saveTeam(team);
}
