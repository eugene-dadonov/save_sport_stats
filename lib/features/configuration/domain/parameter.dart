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

  factory Parameter.newParameter({
    required String name,
    required Sport sport,
  }) {
    return Parameter(
      id: const Uuid().v1(),
      name: name,
      isEternal: false,
      standardParameter: StandardParameter.undefined,
      sport: sport,
    );
  }

  Parameter copyWith({
    String? name,
    Sport? sport,
  }) =>
      Parameter(
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

extension StandardParameterExtension on StandardParameter {
  String getTitle() {
    switch (this) {
      case StandardParameter.scores:
        return "Голы";
      case StandardParameter.undefined:
        return "Неопределено";
      case StandardParameter.shots:
        return "Удары";
      case StandardParameter.shotsInTarget:
        return "Удары в цель";
      case StandardParameter.fouls:
        return "Нарушения";
      case StandardParameter.corners:
        return "Угловые";
      case StandardParameter.cardsRed:
        return "Удаления";
      case StandardParameter.cardsYellow:
        return "Предупреждения";
      case StandardParameter.passes:
        return "Передачи";
    }
  }
}
