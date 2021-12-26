import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';

class EmptyMatchesListView extends StatelessWidget {
  const EmptyMatchesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = ThemeHolder.of(context).secondary1;
    return Column(
      children: [
        StrokeFlatButton(
          text: 'Добавить новую команду',
          onPress: () {},
          height: 60,
        ),
        Center(
          child: Text(
            "У Вас пока нет добавленных команд",
            style: ThemeHolder.of(context).textStyle.h2(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
