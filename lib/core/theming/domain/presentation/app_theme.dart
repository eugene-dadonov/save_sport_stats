import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';

class ThemeHolder extends InheritedWidget {
  const ThemeHolder({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  final AppThemeData theme;

  static AppThemeData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeHolder>()
        !.theme;
  }

  @override
  bool updateShouldNotify(ThemeHolder oldWidget) =>
      theme != oldWidget.theme;
}
