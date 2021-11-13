import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class MatchDateWidget extends StatelessWidget {
  final DateTime date;

  MatchDateWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final day = date.day.toString();
    final mouth = months[date.month].toString();

    final year = date.year > 1999
        ? date.year.toString().substring(2)
        : date.year.toString();

    final textColor = ThemeHolder.of(context).card;

    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: ThemeHolder.of(context).main.withOpacity(0.15),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: ThemeHolder.of(context).textStyle.h3(color: textColor),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            mouth.toUpperCase(),
            style: ThemeHolder.of(context).textStyle.h5(color: textColor),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            year,
            style: ThemeHolder.of(context).textStyle.h3(color: textColor),
          ),
        ],
      ),
    );
  }

  final List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
}
