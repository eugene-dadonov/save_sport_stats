import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class EditTitle extends StatelessWidget {
  const EditTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final color = ThemeHolder.of(context).secondary2;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context).textStyle.t1(color: color),
      ),
    );
  }
}
