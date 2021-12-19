import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/state.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/model/parameter_to_return.dart';

class DialogParametersGetBloc
    extends Bloc<DialogParametersGetEvent, DialogParametersGetState> {
  DialogParametersGetBloc({
    required this.parameterBloc,
    required this.selectedParameters,
  }) : super(LoadingView());

  final ParameterBloc parameterBloc;
  final List<Parameter> selectedParameters;
  Set<Parameter> addedParameters = {};

  @override
  Stream<DialogParametersGetState> mapEventToState(
      DialogParametersGetEvent event) async* {
    if (event is Init) {
      yield* updateScreen();
    } else if (event is ReturnParameters) {
      final parameters = addedParameters.toList();
      yield ReturnParametersBack(parameters);
    } else if (event is AddParameter) {
      print("add parameter");
      addedParameters.add(event.parameter);
      yield* updateScreen();
    } else if (event is RemoveParameter) {
      print("remove parameter");
      addedParameters.remove(event.parameter);
      yield* updateScreen();
    }
  }

  Stream<DialogParametersGetState> updateScreen() async* {
    if (parameterBloc.state.status == ParametersStateStatus.updated) {
      final preparedParameters =
          parameterBloc.state.parameters.map((parameter) {
        final isSelected = selectedParameters.contains(parameter);
        final isAdded = addedParameters.contains(parameter);
        return ParameterToReturn(
          parameter: parameter,
          isSelected: isSelected,
          isAlreadyAdded: isAdded,
        );
      }).toList();

      yield ContentView(parameters: preparedParameters);
    }
  }
}
