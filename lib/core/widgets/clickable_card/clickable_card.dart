import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    Key? key,
    required this.child,
    this.borderRadius,
    required this.onTap,
    this.cardColor = Colors.white,
    this.shadowColor = Colors.black26,
    this.splashColor = Colors.grey,
  }) : super(key: key);

  final Widget child;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final Color cardColor;
  final Color shadowColor;
  final Color splashColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: shadowColor, blurRadius: 6, spreadRadius: 1)
      ]),
      child: Material(
        color: cardColor,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: splashColor.withOpacity(0.2),
          highlightColor: splashColor.withOpacity(0.1),
          child: child,
          onTap: onTap,
        ),
      ),
    );
  }
}
