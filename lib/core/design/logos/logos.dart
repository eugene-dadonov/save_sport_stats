enum Logo {
  oval,
  round,
  shield1,
  shield2,
  shield3,
  shield4,
  shield5,
  shield6,
  rombus1,
  rombus2,
  square,
  triangle1,
  triangle2,
  triangle3,
  pentagon,
  hexagon,
}

extension LogoExtensionX on Logo {
  String toShortString() {
    return toString().split('.').last;
  }

  bool isEqualTo(Logo logo) => index == logo.index;
}
