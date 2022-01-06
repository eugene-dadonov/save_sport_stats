import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/bottom_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';

class BottomTab extends WidgetBloc<BlocBottomTab> {
  const BottomTab({
    Key? key,
    required this.activeTab,
    required this.onTabSelected,
  }) : super(key: key);

  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  @override
  Widget buildUI(BuildContext context, BlocBottomTab bloc) {
    return BlocBuilder<BlocBottomTab, AppTab>(builder: (_, state) {
      final activeColor = ThemeHolder.of(context).main;
      final inactiveColor = ThemeHolder.of(context).secondary1;
      final backgroundColor = ThemeHolder.of(context).card;
      return BottomNavigationBar(
        selectedItemColor: activeColor,
        selectedLabelStyle:
            ThemeHolder.of(context).textStyle.h4(color: activeColor),
        backgroundColor: ThemeHolder.of(context).card,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        items: AppTab.values.map((tab) {
          final iconColor =
              tab.index == activeTab.index ? activeColor : inactiveColor;
          return BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: AppIcon(
              icon: tab.toAppIcon(),
              color: iconColor,
              height: 35,
            ),
            label: getTitle(context, tab),
          );
        }).toList(),
      );
    });
  }

  String getTitle(BuildContext context, AppTab appTab) {
    switch (appTab) {
      case AppTab.matches:
        return AppLocalizations.of(context)!.titleMatches;
      case AppTab.teams:
        return AppLocalizations.of(context)!.titleTeams;
      case AppTab.configuration:
        return AppLocalizations.of(context)!.titleParameters;
      case AppTab.settings:
        return AppLocalizations.of(context)!.titleSettings;
    }
  }
}
