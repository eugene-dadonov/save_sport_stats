enum Logo {
  oval,
  round1,
  round2,
  round3,

  shield1,
  shield2,
  shield3,
  shield4,

  shield5,
  shield6,
  shield7,
  shield8,

  shield9,
  shield10,
  shield11,
  square,

  triangle1,
  triangle2,
  triangle3,
  triangle4,

  rombus1,
  rombus2,
  pentagon,
  hexagon,
}

extension LogoExtensionX on Logo {
  String toShortString() {
    return toString().split('.').last;
  }

  bool isEqualTo(Logo logo) => index == logo.index;
}
