import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/entity/team.dart';

class Match {
  final String id;
  final Team host;
  final Team guest;
  final List<Attribute> attributes;
  final DateTime date;
  final Status status;

  Match({
    required this.id,
    required this.host,
    required this.guest,
    required this.attributes,
    required this.date,
    required this.status,
  });
}

enum Status {
  finished,
  inProcess,
  notStarted,
  canceled,
  unknown,
}
