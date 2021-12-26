import 'package:hive/hive.dart';

part 'parameter_model.g.dart';

@HiveType(typeId: 3)
class ParameterModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeletable;

  @HiveField(3)
  final String sport;

  @HiveField(4)
  final String standardParameter;

  ParameterModel({
    required this.id,
    required this.name,
    required this.isDeletable,
    required this.sport,
    required this.standardParameter,
  });
}
