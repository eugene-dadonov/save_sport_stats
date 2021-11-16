import 'package:sport_stats_live/features/screen_home/domain/bloc/state.dart';

enum AppIcons {
  ok,
  dropdown,
  delete,
  configuration,
  matches,
  teams,
  settings,
  logo,
  forward,
}

extension LogoExtensionX on AppIcons {
  String toShortString() {
    return toString().split('.').last;
  }

  String toPath() {
    final name = toShortString();
    return "assets/graphics/icons/$name.svg";
  }

  bool isEqualTo(AppIcons icon) => index == icon.index;
}

extension AppBarLogo on AppTab {
  AppIcons toAppIcon() {
    switch (this) {
      case AppTab.matches:
        return AppIcons.matches;
      case AppTab.teams:
        return AppIcons.teams;
      case AppTab.configuration:
        return AppIcons.configuration;
      case AppTab.settings:
        return AppIcons.settings;
    }
  }
}
