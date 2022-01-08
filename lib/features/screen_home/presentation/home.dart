import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/home.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bottom_tab/bottom_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/toolbar/toolbar.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/screen_matches.dart';

class HomeScreen extends WidgetBloc<BlocHome> {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const ScreenMatches(),
  ];

  @override
  Widget buildUI(BuildContext context, BlocHome bloc) {
    return BlocBuilder<BlocHome, HomeState>(
      builder: (_, state) {
        return Scaffold(
          appBar: ViewToolbar(),
          bottomNavigationBar: BottomTab(onTabSelected: bloc.switchTo),
          body: PageView(
            onPageChanged: (index) {
              bloc.switchTo(AppTab.values[index]);
            },
            children: screens,
          ),
        );
      },
    );
  }
}
