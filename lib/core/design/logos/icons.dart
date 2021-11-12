enum AppIcons {
  ok,
  dropdown,
  delete,
}

extension LogoExtensionX on AppIcons {
  String toShortString() {
    return toString().split('.').last;
  }

  bool isEqualTo(AppIcons icon) => index == icon.index;
}