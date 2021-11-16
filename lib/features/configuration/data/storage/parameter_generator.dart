import 'package:sport_stats_live/core/base/interfaces/generator.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ParameterGenerator extends Generator {
  @override
  List<Parameter> generate() {
    final parameters = StandardParameter.values
        .where((p) => p != StandardParameter.undefined)
        .map(
          (standardParameter) => Parameter(
            id: standardParameter.toString(),
            standardParameter: standardParameter,
            name: standardParameter.getTitle(),
            sport: Sport.other,
          ),
        );

    return parameters.toList();
  }
}
