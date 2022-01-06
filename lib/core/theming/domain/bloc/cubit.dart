import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/data/themes/themes.dart';

/// BLoC
class BlocTheme extends CubitCell<OnNewTheme> {
  BlocTheme({required AppBloc app}) : super(app, OnNewTheme.light());

  changeTheme(AppTheme theme) {
    if (theme == AppTheme.light) {
      emit(OnNewTheme.light());
    } else if (theme == AppTheme.dark) {
      emit(OnNewTheme.dark());
    }
  }
}

/// State
class OnNewTheme {
  final AppThemeData appTheme;

  OnNewTheme({required this.appTheme});

  OnNewTheme.light() : appTheme = themes[AppTheme.light]!;

  OnNewTheme.dark() : appTheme = themes[AppTheme.dark]!;
}
