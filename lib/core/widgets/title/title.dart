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

class SelectionTitle extends StatelessWidget {
  const SelectionTitle({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final color = ThemeHolder.of(context).secondary2;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2),
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context).textStyle.t1(color: color),
      ),
    );
  }
}
