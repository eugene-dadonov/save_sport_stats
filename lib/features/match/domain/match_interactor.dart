import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';

class MatchInteractor {
  final MatchRepository repository;

  MatchInteractor({required this.repository});

  update(Match match) async {
    await repository.updateMatch(match);
  }

  delete(String id) async {
    await repository.deleteMatch(id);
  }

  getAll() async => await repository.getAllMatches();

  getById(String id) async => await repository.getMatchById(id);

  getActiveMatch() async => await repository.getActiveMatch();
}
