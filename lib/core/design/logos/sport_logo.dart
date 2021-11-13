enum SportLogo {
  football,
  cricket,
  fieldHockey,
  basketball,
  volleyball,
  rugby,
  baseball,
  iceHockey,
  other,
  unknown,
}

extension SportLogoExtension on SportLogo {
  String toShortString() {
    return toString()
        .split('.')
        .last;
  }

  String toPath() {
    final name = toShortString();
    return "assets/graphics/sport_icons/$name.svg";
  }
}