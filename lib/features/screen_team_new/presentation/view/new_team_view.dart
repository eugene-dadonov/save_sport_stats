import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/screen_menu/presentation/widget/menu_button.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_color_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_logo_view.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamEditView extends StatelessWidget {
  final Team team;
  final bool isNewTeam;

  const TeamEditView({
    Key? key,
    required this.team,
    required this.isNewTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildForm(context, team, isNewTeam);
  }

  Widget _buildForm(BuildContext context, Team team, bool isNewTeam) {
    final title = isNewTeam ? "Новая команда" : team.name;

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const RangeMaintainingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ThemeHolder
                      .of(context)
                      .textStyle
                      .h1(color: ThemeHolder
                      .of(context)
                      .main),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: _Title(
                name: 'Название',
              ),
            ),
            _buildInputElement(
              context: context,
              hint: 'Введите название',
              text: team.name,
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
              context: context,
              text: team.city,
              hint: 'Введите город',
              onValueChanged: (newCity) {
                BlocProvider.of<TeamEditBloc>(context)
                    .add(UpdateCityEvent(newCity));
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(child: _Title(name: 'Эмблема'),),
                    SizedBox(width: 24),
                    Expanded(child: _Title(name: 'Цвет'),),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _LogoSelector(team: team),
                  const SizedBox(width: 24),
                  _ColorSelector(team: team),
                ],
              ),
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
                    padding: EdgeInsets.only(bottom: 28, top: 16),
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
    required BuildContext context,
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
            hint: hint.toLowerCase(),
            textColor: ThemeHolder
                .of(context)
                .main,
            fillColor: ThemeHolder
                .of(context)
                .background1,
            borderColor: ThemeHolder
                .of(context)
                .secondary1,
            hintColor: ThemeHolder
                .of(context)
                .secondary2,
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
    final color = ThemeHolder
        .of(context)
        .secondary2;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2),
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: ThemeHolder
            .of(context)
            .textStyle
            .t1(color: color),
      ),
    );
  }
}

class _LogoSelector extends StatelessWidget {
  final Team? team;

  const _LogoSelector({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedLogo = team?.logo ?? Logo.shield2;
    final selectedTeamColor = team?.teamColor ?? TeamColor.black;
    final selectedColor =
    ThemeHolder.of(context).fromTeamColor(selectedTeamColor);

    return _SelectorWidget(
      child: _LogoSelectorIcon(
        teamColor: team?.teamColor ?? TeamColor.black,
        logo: team?.logo ?? Logo.shield1,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (builderContext) {
            final width = MediaQuery
                .of(context)
                .size
                .height;
            return AppDialog(
              child: SizedBox(
                width: width,
                child: DialogLogoSelectorView(
                  currentColor: selectedColor,
                  selectedLogo: selectedLogo,
                  onLogoSelected: (logo) {
                    BlocProvider.of<TeamEditBloc>(context).add(
                        UpdateLogoEvent(logo));
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ColorSelector extends StatelessWidget {
  final Team? team;

  const _ColorSelector({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SelectorWidget(
      child: _ColorSelectorIcon(
        color: team?.teamColor ?? TeamColor.black,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (builderContext) {
            final width = MediaQuery
                .of(context)
                .size
                .height;
            return AppDialog(
              child: SizedBox(
                width: width,
                child: DialogColorSelectorView(
                  currentColor: team?.teamColor ?? TeamColor.black,
                  onColorSelected: (color) {
                    BlocProvider.of<TeamEditBloc>(context)
                        .add(UpdateColorEvent(color));
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          },
        );
      },
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
            color: ThemeHolder
                .of(context)
                .main,
            onPress: () {
              BlocProvider.of<TeamEditBloc>(context).add(SaveTeamEvent());
              Navigator.of(context).pop();
            }),
        const SizedBox(height: 12),
        MenuButton(
            title: 'Отмена'.toUpperCase(),
            color: ThemeHolder
                .of(context)
                .cancel,
            onPress: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}

class _SelectorWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _SelectorWidget({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Material(
        color: ThemeHolder
            .of(context)
            .background1,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        child: InkWell(
          highlightColor: ThemeHolder
              .of(context)
              .secondary1
              .withOpacity(0.05),
          splashColor: ThemeHolder
              .of(context)
              .secondary1
              .withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: child,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 12,
                  bottom: 12,
                  top: 12,
                ),
                child: AppIcon(
                  icon: AppIcons.dropdown,
                  color: ThemeHolder
                      .of(context)
                      .secondary2,
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorSelectorIcon extends StatelessWidget {
  final TeamColor color;

  const _ColorSelectorIcon({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: ThemeHolder.of(context).fromTeamColor(color),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ThemeHolder
                    .of(context)
                    .cardShadow,
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoSelectorIcon extends StatelessWidget {
  final TeamColor teamColor;
  final Logo logo;

  const _LogoSelectorIcon({
    Key? key,
    required this.teamColor,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 100,
        height: 80,
        child: LogoIcon(
          logo: logo,
          color: ThemeHolder.of(context).fromTeamColor(teamColor),
        ),
      ),
    );
  }
}
