import 'package:hive/hive.dart';

part 'team_model.g.dart';

@HiveType(typeId: 2)
class TeamModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String teamColor;

  @HiveField(2)
  final String city;

  TeamModel({
    required this.name,
    required this.teamColor,
    required this.city,
  });
}
