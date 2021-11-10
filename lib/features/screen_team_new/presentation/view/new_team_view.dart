import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/screen_menu/presentation/widget/menu_button.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_color_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_logo_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/color_selector.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamEditView extends StatelessWidget {
  final Team? team;

  const TeamEditView({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildForm(context, team);
  }

  Widget _buildForm(BuildContext context, Team? team) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const RangeMaintainingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: _Title(
                name: 'Название',
              ),
            ),
            _buildInputElement(
              hint: 'Введите название',
              text: team?.name,
              onValueChanged: (newName) {
                BlocProvider.of<TeamEditBloc>(context)
                    .add(UpdateNameEvent(newName));
              },
            ),
            const SliverToBoxAdapter(
              child: _Title(
                name: 'Город',
              ),
            ),
            _buildInputElement(
              text: team?.city,
              hint: 'Введите город',
              onValueChanged: (newCity) {
                BlocProvider.of<TeamEditBloc>(context)
                    .add(UpdateCityEvent(newCity));
              },
            ),
            const SliverToBoxAdapter(
              child: _Title(
                name: 'Эмблема',
              ),
            ),
            SliverToBoxAdapter(
              child: _SelectLogoWidget(
                selectedLogo: team?.logo ?? Logo.round,
                currentColor:
                    team?.teamColor.toColor() ?? TeamColor.black.toColor(),
              ),
            ),
            const SliverToBoxAdapter(
              child: _Title(
                name: 'Цвет',
              ),
            ),
            SliverToBoxAdapter(
              child: _SelectColorWidget(
                  currentColor: team?.teamColor ?? TeamColor.black),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Container(),
                    fit: FlexFit.loose,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 32, top: 16),
                    child: _OperationButtons(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildInputElement({
    required String hint,
    required String? text,
    required ValueChanged<String> onValueChanged,
    FormFieldValidator<String>? validator,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: 50,
          child: InputView(
            text: text ?? "",
            hint: hint.toUpperCase(),
            textColor: AppColors.main,
            fillColor: AppColors.background,
            borderColor: AppColors.secondary,
            hintColor: AppColors.secondary,
            onValueChanged: onValueChanged,
            validator: validator,
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2),
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppStyle.h1(size: 14),
      ),
    );
  }
}

class _SelectLogoWidget extends StatelessWidget {
  final Color currentColor;
  final Logo selectedLogo;

  const _SelectLogoWidget({
    Key? key,
    required this.currentColor,
    required this.selectedLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: AppColors.card,
        child: InkWell(
          customBorder: const CircleBorder(),
          highlightColor: currentColor.withOpacity(0.2),
          splashColor: currentColor.withOpacity(0.2),
          onTap: () {
            showDialog(
              context: context,
              builder: (builderContext) {
                return AppDialog(
                  child: DialogLogoSelectorView(
                    selectedLogo: selectedLogo,
                    currentColor: currentColor,
                    onLogoSelected: (logo) {
                      BlocProvider.of<TeamEditBloc>(context)
                          .add(UpdateLogoEvent(logo));
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                LogoIcon(logo: selectedLogo, color: currentColor, height: 90),
          ),
        ),
      ),
    );
  }
}

class _SelectColorWidget extends StatelessWidget {
  final TeamColor currentColor;

  const _SelectColorWidget({
    Key? key,
    required this.currentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: AppColors.card,
        child: InkWell(
          customBorder: const CircleBorder(),
          highlightColor: currentColor.toColor().withOpacity(0.2),
          splashColor: currentColor.toColor().withOpacity(0.2),
          onTap: () {
            showDialog(
              context: context,
              builder: (builderContext) {
                return AppDialog(
                  child: DialogColorSelectorView(
                    currentColor: currentColor,
                    onColorSelected: (color) {
                      BlocProvider.of<TeamEditBloc>(context)
                          .add(UpdateColorEvent(color));
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: currentColor.toColor(),
            ),
          ),
        ),
      ),
    );
  }
}

class _OperationButtons extends StatelessWidget {
  const _OperationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuButton(
            title: 'Сохранить'.toUpperCase(),
            color: AppColors.main,
            fontSize: 20,
            onPress: () {
              BlocProvider.of<TeamEditBloc>(context).add(SaveTeamEvent());
              Navigator.of(context).pop();
            }),
        const SizedBox(height: 12),
        MenuButton(
            title: 'Отмена'.toUpperCase(),
            color: AppColors.cancel,
            fontSize: 20,
            onPress: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
