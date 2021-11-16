import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/features/screen_home/domain/bloc/state.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  const TabSelector({
    Key? key,
    required this.activeTab,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          label: getTitle(tab),
        );
      }).toList(),
    );
  }

  String getTitle(AppTab appTab) {
    switch (appTab) {
      case AppTab.matches:
        return "матчи";
      case AppTab.teams:
        return "команды";
      case AppTab.configuration:
        return "конфигурация";
      case AppTab.settings:
        return "настройки";
    }
  }
}
