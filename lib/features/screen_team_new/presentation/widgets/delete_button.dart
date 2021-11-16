import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/clickable_card/clickable_card.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onTap;

  const DeleteButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: ClickableCard(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AppIcon(
            icon: AppIcons.delete,
            color: ThemeHolder.of(context).warning,
            height: 20,
          ),
        ),
        borderRadius: BorderRadius.circular(7),
        onTap: onTap,
        splashColor: ThemeHolder.of(context).warning,
        shadowColor: ThemeHolder.of(context).attention.withOpacity(0.1),
        cardColor: ThemeHolder.of(context).attention,
      ),
    );
  }
}
