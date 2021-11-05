import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class MatchEvent {}

class InitialEvent extends MatchEvent {
  String? matchId;

  InitialEvent({this.matchId});
}

class OnParameterChangedEvent extends MatchEvent {
  final String parameterId;
  final int delta;
  final HostStatus hostStatus;

  OnParameterChangedEvent({
    required this.parameterId,
    required this.delta,
    required this.hostStatus,
  });
}
