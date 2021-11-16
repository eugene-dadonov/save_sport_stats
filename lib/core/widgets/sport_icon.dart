import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/design/logos/sport_logo.dart';

class SportIcon extends StatelessWidget {
  const SportIcon({
    Key? key,
    required this.icon,
    this.height = 100,
    this.width = 100,
    this.color = Colors.black,
  }) : super(key: key);

  String get _path => icon.toPath();
  final SportLogo icon;
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
