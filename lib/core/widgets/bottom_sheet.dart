import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/title/title.dart';

class BottomSheetToolbar extends StatelessWidget {
  final bool withBackButton;
  final String title;
  final Widget? trailing;

  const BottomSheetToolbar({
    Key? key,
    this.withBackButton = true,
    required this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 16),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ThemeHolder.of(context).secondary2,
              ),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ThemeHolder.of(context).main,
              ),
            ),
            Expanded(
              child: DialogTitle(
                title: title,
                padding: EdgeInsets.zero,
              ),
            ),
            trailing ?? Container(width: 52),
          ],
        )
      ],
    );
  }
}
