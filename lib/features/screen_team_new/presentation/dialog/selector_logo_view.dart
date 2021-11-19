import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/logo_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          color: ThemeHolder.of(context).card,
        ),
        child: _LogoSelectorView(
          currentColor: currentColor,
          selectedLogo: selectedLogo,
          onLogoSelected: onLogoSelected,
        ),
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
    final color = ThemeHolder.of(context).main;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            AppLocalizations.of(context)!.titleChooseLogo,
            textAlign: TextAlign.center,
            style: ThemeHolder.of(context).textStyle.h2(color: color),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
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
