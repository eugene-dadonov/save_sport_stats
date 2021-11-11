import 'package:flutter/material.dart';

class RoundedRipple extends StatelessWidget {
  final Color rippleColor;
  final Color color;
  final Widget child;
  final double padding;
  final VoidCallback onTap;

  const RoundedRipple({
    Key? key,
    required this.rippleColor,
    required this.child,
    this.padding = 1,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.circle,
      child: InkWell(
        onTap: onTap,
        splashColor: rippleColor.withOpacity(0.2),
        highlightColor: rippleColor.withOpacity(0.2),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
