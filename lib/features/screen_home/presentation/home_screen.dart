import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/home.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bottom_tab/bottom_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/toolbar/toolbar.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/screen_matches.dart';
import 'package:sport_stats_live/features/screen_settings/presentation/screen_settings.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/ui/screen_new_team.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/ui/screen_teams.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class HomeScreen extends WidgetBloc<BlocHome> {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const ScreenMatches(),
    const ScreenTeams(),
    Container(),
    // ScreenNewTeam(team: Team.blank()),
    const ScreenSettings(),
  ];

  @override
  Widget buildUI(BuildContext context, BlocHome bloc) {
    return BlocBuilder<BlocHome, HomeState>(
      builder: (_, state) {
        return Scaffold(
          backgroundColor: ThemeHolder.of(context).background1,
          appBar: const ViewToolbar(),
          bottomNavigationBar: BottomTab(onTabSelected: bloc.switchTo),
          body: buildScreen(state.appTab),
        );
      },
    );
  }

  Widget buildScreen(AppTab appTab) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Builder(
        key: ValueKey(appTab),
        builder: (context) {
          switch (appTab) {
            case AppTab.matches:
              return screens[0];
            case AppTab.teams:
              return screens[1];
            case AppTab.configuration:
              return screens[2];
            case AppTab.settings:
              return screens[3];
          }
        },
      ),
    );
  }
}
