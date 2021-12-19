import '../../parameter.dart';

abstract class ParametersEvent {}

class Init extends ParametersEvent {}

class SaveParameter extends ParametersEvent {
  final Parameter parameter;

  SaveParameter({
    required this.parameter,
  });
}

class DeleteParameter extends ParametersEvent {
  final String id;

  DeleteParameter({
    required this.id,
  });
}
