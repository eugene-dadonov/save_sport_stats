import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';

class EmptyTeamListView extends StatelessWidget {
  const EmptyTeamListView({Key? key, this.onNewTeamClicked}) : super(key: key);

  final VoidCallback? onNewTeamClicked;

  @override
  Widget build(BuildContext context) {
    return _buildEmptyView(context);
  }

  Widget _buildEmptyView(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        _buildSliverAppBar(context),
        _buildNewTeamButton(context),
        _buildSliverEmptyMessage(context)
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeHolder.of(context).background1,
      iconTheme: IconThemeData(
        color: ThemeHolder.of(context).main,
        size: 24,
      ),
      title: Text(
        "Команды",
        style: ThemeHolder.of(context)
            .textStyle
            .h1(color: ThemeHolder.of(context).main),
      ),
    );
  }

  Widget _buildNewTeamButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StrokeFlatButton(
          text: 'Добавить новую команду',
          onPress: () {
            onNewTeamClicked?.call();
          },
          height: 60,
        ),
      ),
    );
  }

  Widget _buildSliverEmptyMessage(BuildContext context) {
    final textColor = ThemeHolder.of(context).secondary2;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Text(
            "У Вас пока нет добавленных команд",
            style: ThemeHolder.of(context).textStyle.h2(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
