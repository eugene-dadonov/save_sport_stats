import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    required this.icon,
    this.height = 100,
    this.width = 100,
    this.color = Colors.black,
  }) : super(key: key);

  String get _path => "assets/graphics/icons/${icon.toShortString()}.svg";
  final AppIcons icon;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(_path, color: color),
    );
  }
}
