import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/view_cubit_configurations.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/view_cubit_parameters.dart';

class CubitConfigurationsScreen extends CubitCell<ContentState> {
  final CubitConfigurationsView cubitConfigurationsView;
  final CubitParametersView cubitParametersView;

  CubitConfigurationsScreen({
    required AppBloc app,
    required this.cubitConfigurationsView,
    required this.cubitParametersView,
  }) : super(app, ContentState());

  Future<void> refresh() async {
    cubitConfigurationsView.refresh();
    cubitParametersView.refresh();
  }
}
