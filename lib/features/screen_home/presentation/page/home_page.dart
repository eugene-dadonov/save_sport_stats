import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_configuration/presentation/page.dart';
import 'package:sport_stats_live/features/screen_home/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_home/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_home/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_home/presentation/tab_selector/tab_selector.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/page/match_list_page.dart';
import 'package:sport_stats_live/features/screen_settings/presentation/page.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/page/team_list_page.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        final textColor = ThemeHolder.of(context).main;
        return Scaffold(
          //TODO: Вынести AppBar в отдельный Bloc
          appBar: AppBar(
            backgroundColor: ThemeHolder.of(context).card,
            elevation: 2,
            shadowColor: ThemeHolder.of(context).cardShadow,
            title: Text(
              "Заголовок",
              style: ThemeHolder.of(context).textStyle.h2(color: textColor),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: AppIcon(
                icon: AppIcons.logo,
                color: ThemeHolder.of(context).warning,
                height: 50,
              ),
            ),
            actions: [],
          ),
          body: _getBody(context, activeTab),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
          ),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, AppTab appTab) {
    switch (appTab) {
      case AppTab.matches:
        return MatchListPage.view(context.read<MatchBloc>());
      case AppTab.teams:
        return TeamsListPage.view(BlocProvider.of<TeamsBloc>(context));
      case AppTab.configuration:
        return ConfigurationScreen.view(
          configurationBloc: BlocProvider.of<ConfigurationBloc>(context),
          parameterBloc: BlocProvider.of<ParameterBloc>(context),
        );
      case AppTab.settings:
        return const SettingsScreen();
    }
  }
}
