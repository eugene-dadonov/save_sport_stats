abstract class ParameterEditEvent {}

class Init extends ParameterEditEvent {}

class UpdateTitle extends ParameterEditEvent {
  final String title;

  UpdateTitle({
    required this.title,
  });
}

class SaveParameter extends ParameterEditEvent {
}
