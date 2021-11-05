abstract class MatchException implements Exception {
  String cause;

  MatchException(this.cause);
}

class NoActiveMatch extends MatchException {
  NoActiveMatch({
    String cause = defaultCause,
  }) : super(cause);

  static const String defaultCause = "No active match";
}
