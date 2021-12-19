import 'package:sport_stats_live/core/base/interfaces/generator.dart';
import 'package:sport_stats_live/features/configuration/data/storage/parameter_generator.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ConfigurationGenerator extends Generator {
  @override
  List<Configuration> generate() {
    final parameters = ParameterGenerator().generate();

    final configuration1 = Configuration.newConfiguration(
      name: "5-й дивизион",
      sport: Sport.football,
      parameters: parameters,
    );

    final configuration2 = Configuration.newConfiguration(
      name: "Лига школы",
      sport: Sport.baseball,
      parameters: parameters.take(4).toList(),
    );

    return [configuration1, configuration2];
  }
}
