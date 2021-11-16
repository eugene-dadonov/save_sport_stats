import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:uuid/uuid.dart';

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

  Configuration.newConfiguration({
    required this.name,
    required this.sport,
    required this.parameters,
  }) : id = const Uuid().v1();
}
