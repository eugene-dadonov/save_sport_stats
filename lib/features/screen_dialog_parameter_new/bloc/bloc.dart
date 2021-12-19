import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/event.dart'
    as parameter_event;
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/screen_dialog_parameter_new/bloc/event.dart'
    as edit;
import 'package:sport_stats_live/features/screen_dialog_parameter_new/bloc/state.dart';

class ParameterEditBloc
    extends Bloc<edit.ParameterEditEvent, ParameterEditState> {
  ParameterEditBloc({
    Parameter? parameter,
    required this.parameterBloc,
  }) : super(Loading()) {
    if (parameter == null) {
      isNewParameter = true;
      this.parameter =
          Parameter.newParameter(name: "", sport: Sport.other);
    } else {
      this.parameter = parameter;
    }
  }

  bool isNewParameter = false;
  final ParameterBloc parameterBloc;
  late Parameter parameter;

  @override
  Stream<ParameterEditState> mapEventToState(
      edit.ParameterEditEvent event) async* {
    if (event is edit.Init) {
      yield ParameterLoaded(
        parameter: parameter,
        isNewParameter: isNewParameter,
      );
    } else if (event is edit.UpdateTitle) {
      parameter = parameter.copyWith(name: event.title);
      yield ParameterLoaded(
        parameter: parameter,
        isNewParameter: isNewParameter,
      );
    } else if (event is edit.SaveParameter) {
      parameterBloc.add(parameter_event.SaveParameter(parameter: parameter));
    }
  }
}
