import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/constraints.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.cardRadius),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
      child: child,
    );
  }
}
