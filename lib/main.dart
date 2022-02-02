import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/theming/data/themes/themes.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/cubit.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/di.dart';
import 'app/presentation/app.dart';

void main() async {
  final di = DependencyInjector();
  await di.prepareDependencies(false);

  runApp(
    ThemeHolder(
      child: MyApp(di: di),
      theme: themes[AppTheme.light]!,
    ),
  );
}

class ThemeBuilder extends WidgetBloc<BlocTheme> {
  final Widget child;

  const ThemeBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget buildUI(BuildContext context, BlocTheme bloc) {
    return ThemeHolder(child: child, theme: themes[AppTheme.light]!);
  }
}
