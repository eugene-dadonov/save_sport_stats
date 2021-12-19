import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

class ParameterToReturn {
  final Parameter parameter;
  final bool isSelected;
  final bool isAlreadyAdded;

  ParameterToReturn({
    required this.parameter,
    required this.isSelected,
    required this.isAlreadyAdded,
  });
}
