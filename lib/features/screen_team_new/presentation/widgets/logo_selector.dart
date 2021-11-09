import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';

class LogoSelector extends StatelessWidget {
  const LogoSelector({
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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Logo.values.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final currentLogo = Logo.values[index];
        final isSelected = currentLogo.isEqualTo(selectedLogo);
        final color =
            isSelected ? currentColor : AppColors.main.withOpacity(0.3);

        final padding = isSelected ? selectedPadding : unselectedPadding;

        return GestureDetector(
          onTap: () {
            onLogoSelected?.call(Logo.values[index]);
          },
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: LogoIcon(logo: Logo.values[index], color: color),
          ),
        );
      },
    );
  }

  static const double selectedPadding = 0;
  static const double unselectedPadding = 5;
}
