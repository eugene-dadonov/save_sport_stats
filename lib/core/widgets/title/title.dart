import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class StyledTitle extends StatelessWidget {
  final String title;
  final EdgeInsets padding;

  const StyledTitle({
    Key? key,
    required this.title,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: ThemeHolder.of(context).textStyle.h3(),
        textAlign: TextAlign.left,
      ),
    );
  }
}
