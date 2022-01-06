import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';

/// Cubit
class BlocBottomTab extends CubitCell<AppTab> {
  BlocBottomTab({
    required AppBloc app,
  }) : super(app, AppTab.matches);

  switchTo(AppTab appTab) {
    emit(appTab);
  }
}
