import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
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

        return GestureDetector(
            onTap: () {
              onColorSelected?.call(TeamColor.values[index]);
            },
            child: isSelected
                ? _SelectedColor(color: currentColor)
                : _NotSelectedColor(color: currentColor));
      },
    );
  }
}

class _NotSelectedColor extends StatelessWidget {
  final TeamColor color;

  const _NotSelectedColor({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeHolder.of(context).fromTeamColor(color),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: ThemeHolder.of(context).cardShadow,
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 4)),
          ],
        ),
      ),
    );
  }
}

class _SelectedColor extends StatelessWidget {
  final TeamColor color;

  const _SelectedColor({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeHolder.of(context).fromTeamColor(color),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: ThemeHolder.of(context).cardShadow,
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 4)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AppIcon(
            icon: AppIcons.ok,
            color: ThemeHolder.of(context).card,
          ),
        ),
      ),
    );
  }
}
