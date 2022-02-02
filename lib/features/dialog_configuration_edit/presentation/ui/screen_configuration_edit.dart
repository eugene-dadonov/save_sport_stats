import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/widgets/bottom_sheet.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/validators.dart';
import 'package:sport_stats_live/core/base/views/error_view.dart';
import 'package:sport_stats_live/core/base/views/loading_view.dart';
import 'package:sport_stats_live/core/widgets/sport_selector/sport_selector_drop.dart';
import 'package:sport_stats_live/core/widgets/title/title.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/dialog_configuration_edit/presentation/cubit/cubit_configurations_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/ui/screen_new_team.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

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
            return ContentView(configuration: state.configuration);
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
  final Configuration configuration;

  const ContentView({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const BottomSheetToolbar(title: 'Новый набор'),
          const SizedBox(height: 16),
          SelectionTitle(name: HelperLocale.of(context).titleSport),
          const SizedBox(height: 10),
          SportSelectorDropdown(
            onSportChanged: (sport) {},
            selectedSport: Sport.other,
          ),
          const SizedBox(height: 10),
          SelectionTitle(name: HelperLocale.of(context).titleName),
          const SizedBox(height: 10),
          DecoratedInputView(
            hint: HelperLocale.of(context).hintEnterName,
            text: configuration.name,
            onValueChanged: (newName) {},
            validator: (value) {
              return isNotNullOrEmpty(context, value);
            },
          ),
        ],
      ),
    );
  }
}
