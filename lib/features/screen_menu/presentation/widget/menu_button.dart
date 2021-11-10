import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;
  final double fontSize;

  const MenuButton({
    required this.title,
    required this.onPress,
    this.color = Colors.black26,
    Key? key,
    this.fontSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              title,
              style: ThemeHolder.of(context).textStyle.h1(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
