import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/mappers/status_mapper.dart';
import 'package:sport_stats_live/features/match/domain/bloc/state.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';

class SportSelectorDropdown extends StatefulWidget {
  const SportSelectorDropdown({
    Key? key,
    required this.selectedStatus,
    required this.onStatusChanged,
  }) : super(key: key);

  final Status selectedStatus;
  final ValueChanged<Status> onStatusChanged;

  @override
  State<SportSelectorDropdown> createState() => _SportSelectorDropdownState();
}

class _SportSelectorDropdownState extends State<SportSelectorDropdown> {
  late Status selectedStatus;

  @override
  void initState() {
    selectedStatus = widget.selectedStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = ThemeHolder.of(context).main;
    final backgroundColor = ThemeHolder.of(context).card;
    final selectedColor = ThemeHolder.of(context).secondary1;

    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: ThemeHolder.of(context).background1,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          padding: EdgeInsets.zero,
          child: DropdownButtonFormField<Status>(
            decoration:
                const InputDecoration.collapsed(hintText: "Выберите статус"),
            dropdownColor: backgroundColor,
            isExpanded: true,
            value: widget.selectedStatus,
            selectedItemBuilder: (status) => Status.values
                .map(
                  (status) => MatchStatusSelectorItem(
                    status: status,
                    backgroundColor: selectedColor,
                    foregroundColor: foregroundColor,
                    height: 50,
                    alignment: MainAxisAlignment.center,
                  ),
                )
                .toList(),
            onChanged: (sport) {
              widget.onStatusChanged.call(sport!);
            },
            isDense: false,
            icon: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: AppIcon(
                icon: AppIcons.dropdown,
                height: 40,
                width: 16,
                color: ThemeHolder.of(context).secondary2,
              ),
            ),
            items: Status.values.map((status) {
              bool isSelected = status == widget.selectedStatus;
              return DropdownMenuItem<Status>(
                value: status,
                child: MatchStatusSelectorItem(
                  alignment: MainAxisAlignment.start,
                  status: status,
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

class MatchStatusSelectorItem extends StatelessWidget {
  const MatchStatusSelectorItem({
    Key? key,
    required this.status,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onTap,
    required this.height,
    required this.alignment,
  }) : super(key: key);

  final Status status;
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;
  final ValueChanged<MatchStatus>? onTap;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: alignment,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            status.toName(context),
            style: ThemeHolder.of(context).textStyle.h3(color: foregroundColor),
          ),
          if (status == Status.inProcess)
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: ThemeHolder.of(context).warning,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
