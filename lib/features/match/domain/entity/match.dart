import 'package:sport_stats_live/features/configuration/domain/sport.dart';
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
  final Sport sport;

  Match({
    required this.id,
    required this.host,
    required this.guest,
    required this.score,
    required this.attributes,
    required this.date,
    required this.status,
    required this.sport,
  });

  Match copyWith(
          {Team? host,
          Team? guest,
          Attribute? score,
          List<Attribute>? attributes,
          DateTime? date,
          Status? status,
          Sport? sport}) =>
      Match(
        id: id,
        host: host ?? this.host,
        guest: guest ?? this.guest,
        status: status ?? this.status,
        date: date ?? this.date,
        attributes: attributes ?? this.attributes,
        score: score ?? this.score,
        sport: sport ?? this.sport,
      );
}

enum Status {
  inProcess,
  finished,
  notStarted,
  canceled,
}

extension MatchStatusX on Status {
  String toTitle() {
    switch (this) {
      case Status.inProcess:
        return "матч идет";
      case Status.finished:
        return "закончен";
      case Status.notStarted:
        return "не начат";
      case Status.canceled:
        return "отменен";
    }
  }
}
