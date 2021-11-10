import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: AppColors.card,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Выберите эмблему".toUpperCase(),
            textAlign: TextAlign.center,
            style: AppStyle.h1(size: 18),
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
