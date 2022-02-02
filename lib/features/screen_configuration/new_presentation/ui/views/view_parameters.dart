import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/dialog_parameter_edit/presentation_edit/ui/dialog_parameter_edit.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/view_cubit_configurations.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/bloc/view_cubit_parameters.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/ui/widget/configurations_list.dart';
import 'package:sport_stats_live/features/screen_configuration/new_presentation/ui/widget/parameter_list.dart';

const double _defaultHeight = 200;

class ViewParameters extends WidgetBloc<CubitParametersView> {
  const ViewParameters({
    Key? key,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.teamsGap,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double teamsGap;

  @override
  Widget buildUI(BuildContext context, CubitParametersView bloc) {
    return BlocBuilder<CubitParametersView, ViewState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const _LoadingView();
        } else if (state is ParametersState) {
          return ParametersListView(
            parameters: state.parameters,
            onTap: (configuration) {
              showDialog(
                context: context,
                builder: (context) {
                  return const DialogParameterEdit();
                },
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
