import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

import 'entity/team.dart';

class TeamInteractor {
  final TeamRepository repository;

  TeamInteractor({required this.repository});

  Future<Transporter<bool>> update(Team team) async =>
      await repository.saveTeam(team);

  Future<Transporter<bool>> delete(String id) async =>
      await repository.delete(id);

  Future<Transporter<List<Team>>> getAll() async => await repository.getTeams();

  Future<Transporter<Team>> getById(String id) async =>
      await repository.getTeamById(id);
}
