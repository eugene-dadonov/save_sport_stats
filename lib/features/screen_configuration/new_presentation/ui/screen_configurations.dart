import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/widgets/title/title.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/screen_cubit.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/ui/views/view_parameters.dart';

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                StyledTitle(
                    title: "Наборы",
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 16,
                    )),
                ViewConfigurations(
                  verticalPadding: 16,
                  horizontalPadding: 16,
                  teamsGap: 10,
                ),
                StyledTitle(
                    title: "Параметры",
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 8,
                    )),
                ViewParameters(
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
