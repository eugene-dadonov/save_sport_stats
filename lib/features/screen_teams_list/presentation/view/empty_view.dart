import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/bloc.dart';

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
        _buildSliverAppBar(),
        _buildNewTeamButton(context),
        _buildSliverEmptyMessage()
      ],
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      title: Text(
        "Команды",
        style: AppStyle.h1(size: 18),
      ),
    );
  }

  Widget _buildNewTeamButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StrokeFlatButton(
          text: 'Добавить новую команду',
          onPress: () => onNewTeamClicked,
          height: 60,
        ),
      ),
    );
  }

  Widget _buildSliverEmptyMessage() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Text(
            "У Вас пока нет добавленных команд",
            style: AppStyle.h1(size: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
