import 'package:sport_stats_live/core/base/data/exception/exception_parser.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/data/storage/match_storage.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchStorage matchStorage;
  String currentMatchId = "";

  MatchRepositoryImpl({required this.matchStorage});

  @override
  Future<Transporter<bool>> updateMatch(Match match) async {
    try {
      await matchStorage.saveMatch(match);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }

  @override
  Future<Transporter<List<Match>>> getAllMatches() async {
    try {
      final matches = await matchStorage.getAllMatches();
      return DataTransporter<List<Match>>(data: matches);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<List<Match>>(e, s);
    }
  }

  @override
  Future<Transporter<Match>> getMatchById(String id) async {
    try {
      final match = await matchStorage.getMatch(id);
      return DataTransporter<Match>(data: match);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<Match>(e, s);
    }
  }

  @override
  Future<Transporter<Match>> getActiveMatch() async {
    try {
      Match match = await matchStorage.getActiveMatch();
      return DataTransporter<Match>(data: match);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<Match>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> updateActiveMatchWithId(String id) async {
    try {
      await matchStorage.updateActiveMatchWithId(id);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> deleteMatch(String id) async {
    try {
      await matchStorage.deleteMatch(id);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }
}
