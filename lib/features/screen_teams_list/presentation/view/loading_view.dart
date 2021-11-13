import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class LoadingTeamListView extends StatelessWidget {
  const LoadingTeamListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildEmptyView(context);
  }

  Widget _buildEmptyView(BuildContext context) {
    return CustomScrollView(
      slivers: [_buildSliverAppBar(context), _buildSliverLoading(context)],
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeHolder.of(context).background1,
      title: Text(
        "Команды",
        style: ThemeHolder.of(context).textStyle.h2(),
      ),
    );
  }

  Widget _buildSliverLoading(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        // TODO: Сделать...
        child: CircularProgressIndicator(color: Colors.red),
      ),
    );
  }
}
