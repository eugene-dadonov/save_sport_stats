import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class Match {
  final String id;
  final Team host;
  final Team guest;
  final Attribute score;
  final List<Attribute> attributes;
  final DateTime date;
  final Status status;

  Match({
    required this.id,
    required this.host,
    required this.guest,
    required this.score,
    required this.attributes,
    required this.date,
    required this.status,
  });

  Match copyWith({
    Team? host,
    Team? guest,
    Attribute? score,
    List<Attribute>? attributes,
    DateTime? date,
    Status? status,
  }) =>
      Match(
        id: id,
        host: host ?? this.host,
        guest: guest ?? this.guest,
        status: status ?? this.status,
        date: date ?? this.date,
        attributes: attributes ?? this.attributes,
        score: score ?? this.score,
      );
}

enum Status {
  finished,
  inProcess,
  notStarted,
  canceled,
  unknown,
}

enum Sport {
  football,
  basketball,
  volleyball,
  baseball,
  cricket,
  hockey,
}
