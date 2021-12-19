import 'package:collection/src/iterable_extensions.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ParameterConverter {
  static Parameter fromModel(ParameterModel model) {
    final parameter = StandardParameter.values.firstWhereOrNull((parameter) {
      return model.standardParameter == parameter.toString();
    });

    final sport = Sport.values.firstWhereOrNull((sport) {
      return model.sport == sport.toString();
    });

    return Parameter(
      id: model.id,
      name: model.name,
      isEternal: model.isDeletable,
      standardParameter: parameter ?? StandardParameter.undefined,
      sport: sport ?? Sport.other,
    );
  }

  static ParameterModel toModel(Parameter parameter) => ParameterModel(
        id: parameter.id,
        name: parameter.name,
        isDeletable: parameter.isEternal,
        sport: parameter.sport.toString(),
        standardParameter: parameter.standardParameter.toString(),
      );
}
