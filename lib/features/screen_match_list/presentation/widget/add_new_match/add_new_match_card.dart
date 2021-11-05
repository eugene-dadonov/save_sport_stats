import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';

class AddNewMatchWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color;

  const AddNewMatchWidget({
    Key? key,
    required this.text,
    this.color = AppColors.backgroundDark,
    required this.onPress,
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
          dashPattern: [6, 6],
          radius: const Radius.circular(10),
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: GoogleFonts.russoOne(
                  fontSize: 18,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
