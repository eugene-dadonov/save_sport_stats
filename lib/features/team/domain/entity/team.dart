class Team {
  String uid;
  String name;
  TeamColor teamColor;
  String city;

  Team({
    required this.uid,
    required this.name,
    required this.teamColor,
    required this.city,
  });
}

enum HostStatus {
  host,
  guest,
}

enum TeamColor {
  redDark,
  red,
  orange,
  yellow,
  green,
  greenLight,
  cyan,
  azure,
  blue,
  purple,
  raspberry,
  pink,
  greyLight,
  grey,
  greyDark,
  black,
}
