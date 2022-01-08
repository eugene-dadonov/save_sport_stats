import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/bloc/cubit_screen_teams.dart';

class ScreenTeams extends WidgetBloc<CubitTeamsScreen> {
  const ScreenTeams({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, CubitTeamsScreen bloc) {
    return BlocBuilder<CubitTeamsScreen, ContentState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [],
            ),
          ),
        );
      },
    );
  }
}
