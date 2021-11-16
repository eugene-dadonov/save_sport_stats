import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/sport_icon.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class SportLogoWidget extends StatelessWidget {
  final Sport sport;

  const SportLogoWidget({
    Key? key,
    required this.sport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: ThemeHolder.of(context).card,
      ),
      child: Center(
        child: SportIcon(
          icon: sport.toSportLogo(),
          color: ThemeHolder.of(context).main,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
