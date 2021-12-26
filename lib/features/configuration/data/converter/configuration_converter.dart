import 'package:collection/src/iterable_extensions.dart';
import 'package:sport_stats_live/features/configuration/data/converter/parameter_converter.dart';
import 'package:sport_stats_live/features/configuration/data/model/configuration_model.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ConfigurationConverter {
  static Configuration fromModel(ConfigurationModel model) {
    final sport = Sport.values.firstWhereOrNull((sport) {
      return model.sport == sport.toString();
    });

    final parameters = model.parameters
        .map((parameterModel) => ParameterConverter.fromModel(parameterModel));

    return Configuration(
      id: model.id,
      name: model.name,
      sport: sport ?? Sport.other,
      parameters: parameters.toList(),
    );
  }

  static ConfigurationModel toModel(Configuration configuration) {
    final parameters = configuration.parameters
        .map((parameter) => ParameterConverter.toModel(parameter));

    return ConfigurationModel(
      name: configuration.name,
      sport: configuration.sport.toString(),
      id: configuration.id,
      parameters: parameters.toList(),
    );
  }
}
