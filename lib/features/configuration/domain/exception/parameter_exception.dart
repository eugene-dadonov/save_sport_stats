abstract class ParameterException implements Exception {
  String cause;

  ParameterException(this.cause);
}

class NoSuchParameter extends ParameterException {
  NoSuchParameter({
    String cause = defaultCause,
    required this.id,
  }) : super(cause);
  final String id;

  static const String defaultCause = "No such parameter!";
}
