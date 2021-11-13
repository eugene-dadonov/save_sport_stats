enum AppIcons {
  ok,
  dropdown,
  delete,
}

extension LogoExtensionX on AppIcons {
  String toShortString() {
    return toString().split('.').last;
  }

  String toPath() {
    final name = toShortString();
    return "assets/graphics/icons/$name.svg";
  }

  bool isEqualTo(AppIcons icon) => index == icon.index;
}