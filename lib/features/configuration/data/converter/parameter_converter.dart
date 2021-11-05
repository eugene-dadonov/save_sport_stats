import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

class ParameterConverter {
  static Parameter fromModel(ParameterModel model) => Parameter(
        id: model.id,
        name: model.name,
        isDeletable: model.isDeletable,
      );

  static ParameterModel toModel(Parameter parameter) => ParameterModel(
        id: parameter.id,
        name: parameter.name,
        isDeletable: parameter.isDeletable,
      );
}
