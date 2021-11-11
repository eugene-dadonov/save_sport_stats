abstract class TeamException implements Exception {
  String cause;

  TeamException(this.cause);
}

class NoSuchTeam extends TeamException {
  NoSuchTeam({
    String cause = defaultCause,
  }) : super(cause);

  static const String defaultCause = "No team with this id!";
}
