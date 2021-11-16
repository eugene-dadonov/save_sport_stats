import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchScreenState {}

class OnLoading extends MatchScreenState {}

class OnMatch extends MatchScreenState {
  OnMatch({required this.match});

  final Match match;
}

class OnNoActiveMatch extends MatchScreenState {}

class OnError extends MatchScreenState {
  final String message;

  OnError(this.message);
}
