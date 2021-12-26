import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class MatchScreenEvent {}

class OpenMatchEvent extends MatchScreenEvent {
  String matchId;

  OpenMatchEvent({
    required this.matchId,
  });
}

class OpenActiveMatchEvent extends MatchScreenEvent {}

class UpdateAttributeEvent extends MatchScreenEvent {
  final String parameterId;
  final int delta;
  final HostStatus hostStatus;

  UpdateAttributeEvent({
    required this.parameterId,
    required this.hostStatus,
    required this.delta,
  });
}

class UpdateScoreEvent extends MatchScreenEvent {
  final int delta;
  final HostStatus hostStatus;

  UpdateScoreEvent({
    required this.hostStatus,
    required this.delta,
  });
}

class UpdateStatusEvent extends MatchScreenEvent {
  final Status status;

  UpdateStatusEvent({
    required this.status,
  });
}
