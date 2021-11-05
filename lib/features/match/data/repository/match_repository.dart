import 'package:sport_stats_live/features/match/data/storage/match_storage.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/exception/exception.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchStorage matchStorage;
  String currentMatchId = "";

  MatchRepositoryImpl({required this.matchStorage});

  @override
  Future<void> updateMatch(Match match) async {
    await matchStorage.saveMatch(match);
  }

  @override
  Future<List<Match>> getAllMatches() async {
    print("getAllMatches");
    final matches = await matchStorage.getAllMatches();
    print("getAllMatches: ${matches.length}");
    return matches;
  }

  @override
  Future<Match?> getMatchById(String id) async =>
      await matchStorage.getMatch(id);

  @override
  Future<Match> getActiveMatch() async {
    print("getActiveMatch");
    Match? match = await matchStorage.getActiveMatch();
    print("active match: ${match?.id ?? -1}");

    return match != null ? match : throw NoActiveMatch();
  }

  @override
  Future<void> updateActiveMatchWithId(String id) async =>
      await matchStorage.updateActiveMatchWithId(id);
}
