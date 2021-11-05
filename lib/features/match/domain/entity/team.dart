class Team {
  String name;
  TeamColor teamColor;
  String city;

  Team({
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
  red,
  lightRed,
  blue,
  lightGreen,
  yellow,
  orange,
  pink,
  lightBlue,
  darkBlue,
  green,
  black,
  purple,
  grey,
}
