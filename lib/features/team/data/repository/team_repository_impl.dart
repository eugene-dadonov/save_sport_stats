import 'package:sport_stats_live/core/base/data/exception/exception_parser.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/team/data/storage/team_storage.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class TeamRepositoryImpl extends TeamRepository {
  final TeamStorage teamStorage;

  TeamRepositoryImpl({required this.teamStorage});

  @override
  Future<Transporter<Team>> getTeamById(String id) async {
    try {
      final team = await teamStorage.getTeam(id);
      return DataTransporter<Team>(data: team);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<Team>(e, s);
    }
  }

  @override
  Future<Transporter<List<Team>>> getTeams() async {
    try {
      final teams = await teamStorage.getTeams();
      return DataTransporter<List<Team>>(data: teams);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<List<Team>>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> saveTeam(Team team) async {
    try {
      await teamStorage.saveTeam(team);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> delete(String id) async {
    try {
      teamStorage.deleteTeam(id);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }
}
