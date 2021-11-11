import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';

class LoadingTeamListView extends StatelessWidget {
  const LoadingTeamListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildEmptyView(context);
  }

  Widget _buildEmptyView(BuildContext context) {
    return CustomScrollView(
      slivers: [_buildSliverAppBar(), _buildSliverLoading()],
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

  Widget _buildSliverLoading() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(color: AppColors.main),
      ),
    );
  }
}
