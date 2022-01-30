import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/interactor_configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/interactor_parameters.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

class ParametersState extends ContentState {
  final List<Parameter> parameters;

  ParametersState({required this.parameters});

  @override
  List<Object?> get props => [parameters];
}

class CubitParametersView extends CubitCell<ViewState> {
  final InteractorParameters _interactorParameters;

  CubitParametersView(
    this._interactorParameters, {
    required AppBloc app,
  }) : super(app, ContentState()) {
    initialize();
  }

  Future<void> refresh() async {
    await initialize();
  }

  Future<void> initialize() async {
    final result = await _interactorParameters.getAll();
    if (result is DataTransporter<List<Parameter>>) {
      if (result.data.isNotEmpty) {
        emit(ParametersState(parameters: result.data));
      } else {
        emit(EmptyState());
      }
    } else if (result is ErrorTransporter<List<Parameter>>) {
      emit(
          ErrorState(errorMessage: result.error.message ?? "Произошла ошибка"));
    }
  }
}
