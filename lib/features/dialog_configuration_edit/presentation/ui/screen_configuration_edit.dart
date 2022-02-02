import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/dialog/bottom_sheet.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/views/error_view.dart';
import 'package:sport_stats_live/core/base/views/loading_view.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/dialog_configuration_edit/presentation/cubit/cubit_configurations_view.dart';

const double _defaultHeight = 200;

class ScreenConfigurationEdit extends WidgetBloc<CubitConfigurationEditScreen> {
  const ScreenConfigurationEdit({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  final Configuration configuration;

  @override
  Widget buildUI(BuildContext context, CubitConfigurationEditScreen bloc) {
    return Scaffold(
      body: BlocBuilder<CubitConfigurationEditScreen, ViewState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingStubView(height: _defaultHeight);
          } else if (state is ConfigurationEditState) {
            return ContentView();
          } else if (state is ErrorState) {
            return ErrorStubView(
              errorMessage: state.errorMessage,
              height: _defaultHeight,
            );
          } else {
            return const ErrorStubView(
              errorMessage: "Неизвестная ошибка",
              height: _defaultHeight,
            );
          }
        },
      ),
    );
  }
}

class ContentView extends StatelessWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomSheetToolbar(
        title: 'Новый набор',
      ),
    );
  }
}
