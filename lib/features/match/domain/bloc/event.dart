import 'package:sport_stats_live/features/match/domain/entity/match.dart';

abstract class MatchEvent {}

class Matches extends MatchEvent {}

class NewMatch extends MatchEvent {
  final Match match;

  NewMatch(this.match);
}

class DeleteMatch extends MatchEvent {
  final String id;

  DeleteMatch(this.id);
}

class UpdateMatch extends MatchEvent {
  final Match match;

  UpdateMatch(this.match);
}

class ActiveMatch extends MatchEvent {
  final String id;

  ActiveMatch(this.id);
}
