import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/color_selector.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/logo_selector.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class DialogColorSelectorView extends StatelessWidget {
  const DialogColorSelectorView({
    Key? key,
    this.onColorSelected,
    required this.currentColor,
  }) : super(key: key);

  final ValueChanged<TeamColor>? onColorSelected;
  final TeamColor currentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        color: ThemeHolder.of(context).card,
      ),
      child: _ColorSelectorView(
        currentColor: currentColor,
        onColorSelected: onColorSelected,
      ),
    );
  }
}

class _ColorSelectorView extends StatelessWidget {
  final ValueChanged<TeamColor>? onColorSelected;
  final TeamColor currentColor;

  const _ColorSelectorView({
    Key? key,
    this.onColorSelected,
    required this.currentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorText = ThemeHolder.of(context).main;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Выберите эмблему",
            textAlign: TextAlign.center,
            style: ThemeHolder.of(context).textStyle.h2(color: colorText),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ColorSelector(
            selectedColor: currentColor,
            onColorSelected: onColorSelected,
          ),
        ),
      ],
    );
  }
}
