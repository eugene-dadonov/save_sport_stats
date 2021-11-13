import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class ScoreCounter extends StatelessWidget {
  final int score;
  final double height;

  const ScoreCounter({
    Key? key,
    required this.score,
    required this.height,
  }) : super(key: key);

  ScoreCounter.small({
    Key? key,
    required this.score,
  })  : height = 40,
        super(key: key);

  ScoreCounter.big({
    Key? key,
    required this.score,
  })  : height = 60,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ThemeHolder.of(context).card;
    final textStyle = height >= 60
        ? ThemeHolder.of(context).textStyle.table(color: color)
        : ThemeHolder.of(context).textStyle.attribute(color: color);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: AspectRatio(aspectRatio: countAspectRatio(score)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            score.toString(),
            maxLines: 1,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ],
    );
  }

  double countAspectRatio(int score) {
    if (score >= 0 && score < 10) {
      return 1.0;
    } else if (score >= 10 && score < 100) {
      return 1.5;
    } else {
      return 2;
    }
  }
}
