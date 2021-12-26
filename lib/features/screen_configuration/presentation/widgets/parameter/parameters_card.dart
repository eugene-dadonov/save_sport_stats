import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/clickable_card/clickable_card.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

class ParameterCard extends StatelessWidget {
  final Parameter parameter;
  final ValueChanged<Parameter> onTap;

  const ParameterCard({
    Key? key,
    required this.parameter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainColor = ThemeHolder.of(context).main;
    final backgroundColor = ThemeHolder.of(context).card;

    return ClickableCard(
      onTap: () {
        onTap.call(parameter);
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      cardColor: backgroundColor,
      splashColor: ThemeHolder.of(context).secondary1,
      shadowColor: ThemeHolder.of(context).cardShadow,
      child: ListTile(
        title: Text(
          parameter.name,
          textAlign: TextAlign.center,
          style: ThemeHolder.of(context).textStyle.h4(color: mainColor),
        ),
      ),
    );
  }
}
