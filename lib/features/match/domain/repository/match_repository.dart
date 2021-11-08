import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchRepository {
  Future<Match?> getMatchById(String id);

  Future<List<Match>> getAllMatches();

  Future<void> updateMatch(Match match);

  Future<bool> deleteMatch(String id);

  Future<Match> getActiveMatch();

  Future<void> updateActiveMatchWithId(String id);
}
