import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/ui/widget/configutation_card.dart';

import 'parameters_card.dart';

class ParametersListView extends StatelessWidget {
  final List<Parameter> parameters;
  final ValueChanged<Parameter> onTap;

  const ParametersListView({
    Key? key,
    required this.parameters,
    required this.onTap,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.cardGap = 0.0,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double cardGap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: parameters.length,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      itemBuilder: (context, index) {
        return ParameterCard(
          parameter: parameters[index],
          onTap: onTap,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: cardGap);
      },
    );
  }
}
