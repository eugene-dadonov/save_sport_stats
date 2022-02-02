import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class BaseDialogView extends StatelessWidget {
  final Widget child;

  const BaseDialogView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: ThemeHolder.of(context).card,
          ),
          child: child,
        ),
      ),
    );
  }
}
