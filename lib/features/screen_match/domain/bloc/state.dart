import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchState {}

class OnLoading extends MatchState {}

class OnMatch extends MatchState {
  OnMatch({required this.match});

  final Match match;
}

class OnNoActiveMatch extends MatchState {}

class OnError extends MatchState {
  final String message;

  OnError(this.message);
}
