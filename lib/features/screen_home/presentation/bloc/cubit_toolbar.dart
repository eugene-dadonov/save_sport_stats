import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'app_tab.dart';

/// Cubit
class BlocToolbar extends CubitCell<AppTab> {
  BlocToolbar({
    required AppBloc app,
  }) : super(app, AppTab.matches);

  switchTo(AppTab appTab) {
    emit(appTab);
  }
}
