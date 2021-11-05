import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchRepository {
  Future<Match?> getMatchById(String id);

  Future<List<Match>> getAllMatches();

  Future<void> updateMatch(Match match);

  /// Active match can't be open before creating;
  Future<Match> getActiveMatch();

  Future<void> updateActiveMatchWithId(String id);
}
