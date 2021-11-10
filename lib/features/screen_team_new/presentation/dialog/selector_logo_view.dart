import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/logo_selector.dart';

class DialogLogoSelectorView extends StatelessWidget {
  const DialogLogoSelectorView({
    Key? key,
    required this.selectedLogo,
    this.onLogoSelected,
    required this.currentColor,
  }) : super(key: key);

  final Logo selectedLogo;
  final ValueChanged<Logo>? onLogoSelected;
  final Color currentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: AppColors.card,
      ),
      child: _LogoSelectorView(
        currentColor: currentColor,
        selectedLogo: selectedLogo,
        onLogoSelected: onLogoSelected,
      ),
    );
  }
}

class _LogoSelectorView extends StatelessWidget {
  final Logo selectedLogo;
  final ValueChanged<Logo>? onLogoSelected;
  final Color currentColor;

  const _LogoSelectorView({
    Key? key,
    required this.selectedLogo,
    this.onLogoSelected,
    required this.currentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Выберите эмблему".toUpperCase(),
            textAlign: TextAlign.center,
            style: AppStyle.h1(size: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LogoSelector(
            selectedLogo: selectedLogo,
            currentColor: currentColor,
            onLogoSelected: onLogoSelected,
          ),
        ),
      ],
    );
  }
}
