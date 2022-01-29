import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/screen_cubit.dart';

import 'views/view_configurations.dart';

class ScreenConfigurations extends WidgetBloc<CubitConfigurationsScreen> {
  const ScreenConfigurations({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, CubitConfigurationsScreen bloc) {
    return BlocBuilder<CubitConfigurationsScreen, ContentState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                ViewConfigurations(
                  verticalPadding: 16,
                  horizontalPadding: 16,
                  teamsGap: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
