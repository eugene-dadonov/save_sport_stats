import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/event.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/state.dart';
import 'package:sport_stats_live/features/configuration/domain/exception/parameter_exception.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/parameter_repository.dart';

class ParameterBloc extends Bloc<ParametersEvent, ParametersState> {
  ParameterBloc({
    required this.repository,
  }) : super(ParametersState.loading());

  final ParameterRepository repository;

  @override
  Stream<ParametersState> mapEventToState(ParametersEvent event) async* {
    try {
      if (event is Init) {
        final parameters = await repository.getParameters();
        yield ParametersState.updated(parameters: parameters);
      } else if (event is SaveParameter) {
        await repository.saveParameter(event.parameter);
        final parameters = await repository.getParameters();
        yield ParametersState.updated(parameters: parameters);
      } else if (event is DeleteParameter) {
        repository.delete(event.id);
        final parameters = await repository.getParameters();
        yield ParametersState.updated(parameters: parameters);
      }
    } on NoSuchParameter {
      yield ParametersState.error(message: "Параметр не найдена!");
    } catch (e) {
      yield ParametersState.error(message: e.toString());
    }
  }
}
