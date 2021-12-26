import 'package:hive/hive.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';

part 'configuration_model.g.dart';

@HiveType(typeId: 4)
class ConfigurationModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<ParameterModel> parameters;

  @HiveField(3)
  final String sport;

  ConfigurationModel({
    required this.id,
    required this.name,
    required this.parameters,
    required this.sport,
  });
}
