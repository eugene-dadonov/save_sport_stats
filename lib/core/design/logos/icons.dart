enum AppIcons {
  ok,
  dropdown,
}

extension LogoExtensionX on AppIcons {
  String toShortString() {
    return toString().split('.').last;
  }

  bool isEqualTo(AppIcons icon) => index == icon.index;
}