import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/interactor_configuration.dart';

class ConfigurationsState extends ContentState {
  final List<Configuration> configurations;

  ConfigurationsState({required this.configurations});

  @override
  List<Object?> get props => [configurations];
}

class CubitConfigurationsView extends CubitCell<ViewState> {
  final InteractorConfiguration _interactorConfiguration;

  CubitConfigurationsView(
    this._interactorConfiguration, {
    required AppBloc app,
  }) : super(app, ContentState()) {
    initialize();
  }

  Future<void> refresh() async {
    await initialize();
  }

  Future<void> initialize() async {
    final result = await _interactorConfiguration.getAll();
    if (result is DataTransporter<List<Configuration>>) {
      if (result.data.isNotEmpty) {
        emit(ConfigurationsState(configurations: result.data));
      } else {
        emit(EmptyState());
      }
    } else if (result is ErrorTransporter<List<Configuration>>) {
      emit(
          ErrorState(errorMessage: result.error.message ?? "Произошла ошибка"));
    }
  }
}
