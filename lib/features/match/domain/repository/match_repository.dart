import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchRepository {
  Future<Transporter<Match>> getMatchById(String id);

  Future<Transporter<List<Match>>> getAllMatches();

  Future<Transporter<bool>> updateMatch(Match match);

  Future<Transporter<bool>> deleteMatch(String id);

  Future<Transporter<Match>> getActiveMatch();

  Future<Transporter<bool>> updateActiveMatchWithId(String id);
}
