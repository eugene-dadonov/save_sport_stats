import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:uuid/uuid.dart';

class Parameter {
  final String id;
  final String name;
  final bool isEternal;
  final StandardParameter standardParameter;
  final Sport sport;

  Parameter({
    required this.id,
    required this.name,
    this.isEternal = false,
    required this.standardParameter,
    required this.sport,
  });

  factory Parameter.newParameter(String name, Sport sport) {
    return Parameter(
      id: const Uuid().v1(),
      name: name,
      isEternal: false,
      standardParameter: StandardParameter.undefined,
      sport: sport,
    );
  }

  Parameter copyWith(String? name, Sport? sport) => Parameter(
        id: id,
        name: name ?? this.name,
        isEternal: isEternal,
        standardParameter: standardParameter,
        sport: sport ?? this.sport,
      );
}

enum StandardParameter {
  scores,
  undefined,
  shots,
  shotsInTarget,
  fouls,
  corners,
  cardsRed,
  cardsYellow,
  passes,
}
