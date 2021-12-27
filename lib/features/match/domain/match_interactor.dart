import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';

class MatchInteractor {
  final MatchRepository repository;

  MatchInteractor({required this.repository});

  Future<Transporter<bool>> update(Match match) async =>
      await repository.updateMatch(match);

  Future<Transporter<bool>> delete(String id) async =>
      await repository.deleteMatch(id);

  Future<Transporter<List<Match>>> getAll() async =>
      await repository.getAllMatches();

  Future<Transporter<Match>> getById(String id) async =>
      await repository.getMatchById(id);

  Future<Transporter<Match>> getActiveMatch() async =>
      await repository.getActiveMatch();

  Future<Transporter<bool>> updateActiveMatchWithId(String id) async =>
      await repository.updateActiveMatchWithId(id);
}
