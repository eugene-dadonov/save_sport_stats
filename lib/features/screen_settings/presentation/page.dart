import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/data/themes/themes.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/bloc.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/event.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final main = ThemeHolder.of(context).main;
    return Scaffold(
      backgroundColor: ThemeHolder.of(context).background1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeHolder.of(context).card,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)!.titleDarkTheme,
                  style: ThemeHolder.of(context).textStyle.h3(color: main),
                ),
                trailing: Switch(
                  activeColor: ThemeHolder.of(context).main,
                  value: ThemeHolder.of(context).isDark,
                  onChanged: (value) {
                    final theme = value ? AppTheme.dark : AppTheme.light;
                    // BlocProvider.of<ThemeBloc>(context).add(ThemeEvent(theme));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
