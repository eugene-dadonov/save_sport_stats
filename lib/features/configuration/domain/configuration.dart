import 'package:sport_stats_live/features/configuration/domain/sport.dart';

import 'parameter.dart';

class Configuration {
  final String id;
  final String name;
  final List<Parameter> parameters;
  final Sport sport;

  Configuration({
    required this.id,
    required this.name,
    required this.parameters,
    required this.sport,
  });
}
