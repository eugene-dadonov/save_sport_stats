import 'package:hive/hive.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';

part 'attribute_model.g.dart';

@HiveType(typeId: 1)
class AttributeModel {
  AttributeModel({
    required this.parameter,
    required this.host,
    required this.guest,
  });

  @HiveField(0)
  final ParameterModel parameter;

  @HiveField(1)
  final int host;

  @HiveField(2)
  final int guest;
}
