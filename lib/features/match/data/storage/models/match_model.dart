import 'package:hive/hive.dart';
import 'attribute_model.dart';
import 'team_shot_model.dart';

part 'match_model.g.dart';

@HiveType(typeId: 0)
class MatchModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final TeamShotModel host;

  @HiveField(2)
  final TeamShotModel guest;

  @HiveField(3)
  final AttributeModel score;

  @HiveField(4)
  final List<AttributeModel> attributes;

  @HiveField(5)
  final int dateTime;

  @HiveField(6)
  final String status;

  MatchModel({
    required this.id,
    required this.host,
    required this.guest,
    required this.score,
    required this.attributes,
    required this.dateTime,
    required this.status,
  });
}
