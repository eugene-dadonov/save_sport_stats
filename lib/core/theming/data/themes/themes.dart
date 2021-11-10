import 'package:sport_stats_live/core/theming/data/colors/colors_dark.dart';
import 'package:sport_stats_live/core/theming/data/colors/colors_light.dart';
import 'app_theme_data.dart';

enum AppTheme {
  light,
  dark,
}

final themes = {
  AppTheme.light: light,
  AppTheme.dark: dark,
};

final AppThemeData light = AppThemeData.lightBase(
  themeData: AppTheme.light,
  main: ColorsLight.main,
  background1: ColorsLight.background,
  secondary1: ColorsLight.secondary1,
  secondary2: ColorsLight.secondary2,
  card: ColorsLight.card,
  cardShadow: ColorsLight.cardShadow,
  ok: ColorsLight.ok,
  cancel: ColorsLight.cancel,
);

final AppThemeData dark = AppThemeData.lightBase(
  themeData: AppTheme.dark,
  main: ColorsDark.main,
  background1: ColorsDark.background,
  secondary1: ColorsDark.secondary1,
  secondary2: ColorsDark.secondary2,
  card: ColorsDark.card,
  cardShadow: ColorsDark.cardShadow,
  ok: ColorsDark.ok,
  cancel: ColorsDark.cancel,
);
