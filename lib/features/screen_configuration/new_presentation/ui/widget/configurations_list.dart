import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/ui/widget/configutation_card.dart';

class ConfigurationsListView extends StatelessWidget {
  final List<Configuration> configurations;
  final ValueChanged<Configuration> onTap;

  const ConfigurationsListView({
    Key? key,
    required this.configurations,
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
      itemCount: configurations.length,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      itemBuilder: (context, index) {
        return ConfigurationCard(
          configuration: configurations[index],
          onTap: onTap,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: cardGap);
      },
    );
  }
}
