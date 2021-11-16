import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

import '../sport_icon.dart';

class SportSelectorDropdown extends StatefulWidget {
  const SportSelectorDropdown({
    Key? key,
    required this.selectedSport,
    required this.onSportChanged,
  }) : super(key: key);

  final Sport selectedSport;
  final ValueChanged<Sport> onSportChanged;

  @override
  State<SportSelectorDropdown> createState() => _SportSelectorDropdownState();
}

class _SportSelectorDropdownState extends State<SportSelectorDropdown> {

  late Sport currentSport;

  @override
  void initState() {
    currentSport = widget.selectedSport;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = ThemeHolder.of(context).main;
    final backgroundColor = ThemeHolder.of(context).card;
    final selectedColor = ThemeHolder.of(context).secondary1;

    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: ThemeHolder.of(context).background1,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          padding: EdgeInsets.zero,
          child: DropdownButtonFormField<Sport>(
            decoration:
                const InputDecoration.collapsed(hintText: "Выберите спорт"),
            dropdownColor: backgroundColor,
            isExpanded: true,
            value: widget.selectedSport,
            selectedItemBuilder: (sport) => Sport.values
                .map(
                  (sport) => SportSelectorItem(
                    sport: sport,
                    backgroundColor: selectedColor,
                    foregroundColor: foregroundColor,
                    height: 50,
                    alignment: MainAxisAlignment.center,
                  ),
                ).toList(),
            onChanged: (sport) {
              currentSport = sport ?? Sport.unknown;
              widget.onSportChanged.call(sport!);
            },
            isDense: false,
            icon: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: AppIcon(
                icon: AppIcons.dropdown,
                height: 16,
                width: 16,
                color: ThemeHolder.of(context).secondary2,
              ),
            ),
            items: Sport.values.map((sport) {
              bool isSelected = sport == widget.selectedSport;
              return DropdownMenuItem<Sport>(
                value: sport,
                child: SportSelectorItem(
                  alignment: MainAxisAlignment.start,
                  sport: sport,
                  height: 50,
                  foregroundColor: isSelected ? selectedColor : foregroundColor,
                  backgroundColor: backgroundColor,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class SportSelectorItem extends StatelessWidget {
  const SportSelectorItem({
    Key? key,
    required this.sport,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onTap,
    required this.height,
    required this.alignment,
  }) : super(key: key);

  final Sport sport;
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;
  final ValueChanged<Sport>? onTap;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SportIcon(
            icon: sport.toSportLogo(),
            color: foregroundColor,
            width: 30,
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            sport.toSportName(),
            style: ThemeHolder.of(context).textStyle.h3(color: foregroundColor),
          ),
        ),
      ],
    );
  }
}
