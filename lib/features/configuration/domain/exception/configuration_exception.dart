abstract class ConfigurationException implements Exception {
  String cause;

  ConfigurationException(this.cause);
}

class NoSuchConfiguration extends ConfigurationException {
  NoSuchConfiguration({
    String cause = defaultCause,
    required this.id,
  }) : super(cause);
  final String id;

  static const String defaultCause = "No such parameter!";
}
