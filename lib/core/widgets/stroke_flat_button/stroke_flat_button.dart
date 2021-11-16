import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class StrokeFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color;
  final double height;

  const StrokeFlatButton({
    Key? key,
    required this.text,
    this.color = Colors.grey,
    required this.onPress,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.2),
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
          color: color,
          dashPattern: const [6, 6],
          radius: const Radius.circular(10),
          child: SizedBox(
            height: height,
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: ThemeHolder.of(context).textStyle.b2(color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
