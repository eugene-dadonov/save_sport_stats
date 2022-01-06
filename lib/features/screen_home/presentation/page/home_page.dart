import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/screen_matches.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

class HomeScreenOld extends StatefulWidget {
  const HomeScreenOld({Key? key}) : super(key: key);

  @override
  State<HomeScreenOld> createState() => _HomeScreenOldState();
}

class _HomeScreenOldState extends State<HomeScreenOld> {
  late List<Widget> pages;

  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    pages = <Widget>[
      const ScreenMatches(),
      // TeamsListPage.view(BlocProvider.of<TeamsBloc>(context)),
      // ConfigurationScreen.view(
      //   configurationBloc: BlocProvider.of<ConfigurationBloc>(context),
      //   parameterBloc: BlocProvider.of<ParameterBloc>(context),
      // ),
      // const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocBuilder<TabBloc, AppTab>(
    //   builder: (context, activeTab) {
    //     return Scaffold(
    //       appBar: _buildAppBar(context, activeTab),
    //       body: PageView(
    //         controller: pageController,
    //         onPageChanged: (index) {
    //           // BlocProvider.of<TabBloc>(context)
    //           //     .add(TabUpdated(AppTab.values[index]));
    //         },
    //         children: pages,
    //       ),
    //       bottomNavigationBar: BottomTab(
    //           activeTab: activeTab,
    //           onTabSelected: (tab) {
    //             // BlocProvider.of<TabBloc>(context).add(TabUpdated(tab));
    //             // pageController.jumpToPage(tab.index);
    //           }),
    //     );
    //   },
    // );
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
            getTitle(context, appTab),
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
            getTitle(context, appTab),
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
            getTitle(context, appTab),
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
            getTitle(context, appTab),
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

String getTitle(BuildContext context, AppTab appTab) {
  switch (appTab) {
    case AppTab.matches:
      return HelperLocale.of(context).titleMatches;
    case AppTab.teams:
      return HelperLocale.of(context).titleTeams;
    case AppTab.configuration:
      return HelperLocale.of(context).titleParameters;
    case AppTab.settings:
      return HelperLocale.of(context).titleSettings;
  }
}
