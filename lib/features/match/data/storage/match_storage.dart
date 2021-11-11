import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchStorage {
  Future<Match> getMatch(String id);

  Future<List<Match>> getAllMatches();

  Future<void> saveMatch(Match match);

  Future<Match?> getActiveMatch();

  Future<bool> deleteMatch(String id);

  Future<void> updateActiveMatchWithId(String id);
}
