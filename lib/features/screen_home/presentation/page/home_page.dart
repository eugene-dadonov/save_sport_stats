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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> pages;
  int _selectedIndex = 0;

  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    pages = <Widget>[
      MatchListPage.view(context.read<MatchBloc>()),
      TeamsListPage.view(BlocProvider.of<TeamsBloc>(context)),
      ConfigurationScreen.view(
        configurationBloc: BlocProvider.of<ConfigurationBloc>(context),
        parameterBloc: BlocProvider.of<ParameterBloc>(context),
      ),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: _buildAppBar(context, activeTab),
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              BlocProvider.of<TabBloc>(context).add(TabUpdated(AppTab.values[index]));
            },
            children: pages,
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) {
              BlocProvider.of<TabBloc>(context).add(TabUpdated(tab));
              pageController.jumpToPage(tab.index);
            }
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, AppTab appTab) {
    final textColor = ThemeHolder.of(context).main;

    switch (appTab) {
      case AppTab.matches:
        return AppBar(
          centerTitle: true,
          backgroundColor: ThemeHolder.of(context).card,
          elevation: 2,
          shadowColor: ThemeHolder.of(context).cardShadow,
          title: Text(
            "Матчи",
            style: ThemeHolder.of(context).textStyle.h2(color: textColor),
          ),
          leading: const _AppLogo(),
        );
      case AppTab.teams:
        return AppBar(
          centerTitle: true,
          backgroundColor: ThemeHolder.of(context).card,
          elevation: 2,
          shadowColor: ThemeHolder.of(context).cardShadow,
          title: Text(
            "Команды",
            style: ThemeHolder.of(context).textStyle.h2(color: textColor),
          ),
          leading: const _AppLogo(),
        );
      case AppTab.configuration:
        return AppBar(
          centerTitle: true,
          backgroundColor: ThemeHolder.of(context).card,
          elevation: 2,
          shadowColor: ThemeHolder.of(context).cardShadow,
          title: Text(
            "Параметры",
            style: ThemeHolder.of(context).textStyle.h2(color: textColor),
          ),
          leading: const _AppLogo(),
        );
      case AppTab.settings:
        return AppBar(
          centerTitle: true,
          backgroundColor: ThemeHolder.of(context).card,
          elevation: 2,
          shadowColor: ThemeHolder.of(context).cardShadow,
          title: Text(
            "Настройки",
            style: ThemeHolder.of(context).textStyle.h2(color: textColor),
          ),
          leading: const _AppLogo(),
        );
    }
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: AppIcon(
        icon: AppIcons.logo,
        color: ThemeHolder.of(context).warning,
        height: 50,
      ),
    );
  }
}

