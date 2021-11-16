import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({
    Key? key,
    required this.logo,
    this.height = 100,
    this.width = 100,
    this.color = Colors.grey,
  }) : super(key: key);

  String get _path => "assets/graphics/logos/${logo.toShortString()}.svg";
  final Logo logo;
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
