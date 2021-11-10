import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class ColorSelector extends StatelessWidget {
  final TeamColor selectedColor;
  final ValueChanged<TeamColor>? onColorSelected;

  const ColorSelector({
    Key? key,
    required this.selectedColor,
    this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: TeamColor.values.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final currentColor = TeamColor.values[index];
        final isSelected = selectedColor.isEqual(currentColor);

        final padding = isSelected ? selectedPadding : unselectedPadding;
        final borderColor =
            isSelected ? AppColors.background : Colors.transparent;

        return GestureDetector(
          onTap: () {
            onColorSelected?.call(TeamColor.values[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(outerRadius),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeHolder.of(context).fromTeamColor(selectedColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(innerRadius),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static const double innerRadius = 7;
  static const double outerRadius = 12;
  static const double selectedPadding = 5;
  static const double unselectedPadding = 15;
}
