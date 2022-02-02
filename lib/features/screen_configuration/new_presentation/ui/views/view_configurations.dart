import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/dialog_configuration_edit/presentation/ui/screen_configuration_edit.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/view_cubit_configurations.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/ui/widget/configurations_list.dart';

const double _defaultHeight = 200;

class ViewConfigurations extends WidgetBloc<CubitConfigurationsView> {
  const ViewConfigurations({
    Key? key,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.teamsGap,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double teamsGap;

  @override
  Widget buildUI(BuildContext context, CubitConfigurationsView bloc) {
    return BlocBuilder<CubitConfigurationsView, ViewState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const _LoadingView();
        } else if (state is ConfigurationsState) {
          return ConfigurationsListView(
            configurations: state.configurations,
            onTap: (configuration) {
              openNewConfigurationDialog(
                context: context,
                configuration: configuration,
              );
            },
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            cardGap: teamsGap,
          );
        } else if (state is EmptyState) {
          return _EmptyView(
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
          );
        } else if (state is ErrorState) {
          return _ErrorView(
            errorMessage: state.errorMessage,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
          );
        } else {
          return _ErrorView(
            errorMessage: "Неизвестная ошибка",
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
          );
        }
      },
    );
  }

  Future<T?> openNewConfigurationDialog<T>({
    required BuildContext context,
    required Configuration configuration,
  }) {
    return showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      expand: true,
      builder: (BuildContext context) {
        return ScreenConfigurationEdit(configuration: configuration);
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: _defaultHeight,

      /// TODO: Заменить на нормальную загрузку
      child: CircularProgressIndicator(),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({
    Key? key,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward_sharp,
                color: ThemeHolder.of(context).secondary2,
                size: 40,
              ),
              const SizedBox(height: 20),
              Text(
                "У вас еще нет команд.\nДобавьте их скорее!",
                style: ThemeHolder.of(context)
                    .textStyle
                    .h3(color: ThemeHolder.of(context).secondary1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    Key? key,
    required this.errorMessage,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
  }) : super(key: key);

  final String errorMessage;

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Center(
          child: Text(
            errorMessage,
            style: ThemeHolder.of(context).textStyle.h3(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
