import 'package:sport_stats_live/features/match/domain/entity/match.dart';

enum MatchStatus {
  loading,
  success,
  failed,
  empty,
}

class MatchState {
  final MatchStatus status;
  final List<Match> matches;
  final Match? activeMatch;
  final String? message;

  MatchState({
    required this.status,
    required this.matches,
    required this.activeMatch,
    this.message,
  });

  MatchState.empty()
      : matches = [],
        status = MatchStatus.empty,
        activeMatch = null,
        message = null;

  MatchState.failed({required this.message})
      : matches = [],
        status = MatchStatus.failed,
        activeMatch = null;

  MatchState.loading()
      : matches = [],
        status = MatchStatus.loading,
        activeMatch = null,
        message = null;

  MatchState.success({
    required this.matches,
    this.activeMatch,
  })  : status = MatchStatus.success,
        message = null;
}
