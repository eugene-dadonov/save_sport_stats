import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;

  const MenuButton({
    required this.title,
    required this.onPress,
    this.color = Colors.black26,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        splashColor: color.withOpacity(0.5),
        highlightColor: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            title,
            style: GoogleFonts.russoOne(fontSize: 24, color: color),
          )),
        ),
      ),
    );
  }
}
