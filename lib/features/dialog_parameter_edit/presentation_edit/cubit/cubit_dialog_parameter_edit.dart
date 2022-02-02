import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/configuration/domain/interactor_parameters.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ParameterEditState extends ViewState {
  final Parameter parameter;
  final bool isNew;

  ParameterEditState({
    required this.parameter,
    required this.isNew,
  });

  @override
  List<Object?> get props => [parameter, isNew];
}

class CubitParametersDialog extends CubitCell<ViewState> {
  final InteractorParameters _interactorParameters;
  late Parameter parameter;
  late bool isNew;

  CubitParametersDialog(
    this._interactorParameters, {
    required AppBloc app,
    Parameter? parameter,
  }) : super(app, LoadingState()) {
    if (parameter != null) {
      this.parameter = parameter;
      isNew = false;
    } else {
      this.parameter = Parameter.newParameter(name: "", sport: Sport.other);
      isNew = true;
    }

    initialization();
  }

  void initialization() {
    emit(ParameterEditState(parameter: parameter, isNew: isNew));
  }

  Future<void> refresh() async {
    initialization();
  }

  updateTitle(String title) {
    parameter = parameter.copyWith(name: title);
    initialization();
  }

  saveParameter() {
    _interactorParameters.save(parameter);
  }
}
