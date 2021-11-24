import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

class ParameterItem extends StatelessWidget {
  const ParameterItem({
    Key? key,
    required this.parameter,
  }) : super(key: key);

  final Parameter parameter;

  @override
  Widget build(BuildContext context) {
    final colorMain = ThemeHolder.of(context).main;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppIcon(
            icon: AppIcons.drag,
            color: colorMain,
            width: 30,
            height: 30,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                parameter.name,
                style: ThemeHolder.of(context).textStyle.h3(color: colorMain),
              ),
            ),
          ),
          AppIcon(
            icon: AppIcons.delete,
            color: colorMain,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
