import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/clickable_card/clickable_card.dart';
import 'package:sport_stats_live/core/widgets/sport_icon.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ConfigurationCard extends StatelessWidget {
  final Configuration configuration;
  final ValueChanged<Configuration> onTap;

  const ConfigurationCard({
    Key? key,
    required this.configuration,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainColor = ThemeHolder.of(context).main;
    final backgroundColor = ThemeHolder.of(context).card;
    final secondaryColor = ThemeHolder.of(context).secondary1;

    return ClickableCard(
      onTap: () {
        onTap.call(configuration);
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      cardColor: backgroundColor,
      splashColor: ThemeHolder.of(context).secondary1,
      shadowColor: ThemeHolder.of(context).cardShadow,
      child: ListTile(
        title: Text(
          configuration.name,
          style: ThemeHolder.of(context).textStyle.h4(color: mainColor),
        ),
        leading: SportIcon(
          icon: configuration.sport.toSportLogo(),
          color: mainColor,
          width: 30,
          height: 40,
        ),
        subtitle: Text(
          "Параметров: ${configuration.parameters.length.toString()}",
          maxLines: 1,
          style: ThemeHolder.of(context).textStyle.h5(color: secondaryColor),
        ),
        trailing: AppIcon(
          icon: AppIcons.forward,
          color: secondaryColor,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
