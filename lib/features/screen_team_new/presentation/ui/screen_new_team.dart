import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/core/widgets/sport_selector/sport_selector_drop.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/presentation/view/new_configuration_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/bloc/cubit_new_team_screen.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/delete_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_color_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_logo_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/delete_button.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/event.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

const double _defaultHeight = 200;

class ScreenNewTeam extends WidgetBloc<CubitNewTeamScreen> {
  const ScreenNewTeam({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget buildUI(BuildContext context, CubitNewTeamScreen bloc) {
    return BlocBuilder<CubitNewTeamScreen, ViewState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const _LoadingView();
        } else if (state is NewTeamState) {
          return _NewTeamContent(
            team: state.team,
            bloc: bloc,
          );
        } else if (state is ErrorState) {
          return _ErrorView(errorMessage: state.errorMessage);
        } else {
          return const _ErrorView(errorMessage: "Неизвестная ошибка");
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

final _formKey = GlobalKey();

class _NewTeamContent extends StatelessWidget {
  const _NewTeamContent({
    Key? key,
    required this.team,
    required this.bloc,
  }) : super(key: key);

  final Team team;
  final CubitNewTeamScreen bloc;

  @override
  Widget build(BuildContext context) {
    final title = "Test title";

    return Scaffold(
      backgroundColor: ThemeHolder.of(context).card,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// TopBar
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: _TopBar(title: title, team: team),
            ),

            /// Type of Sport
            _Title(name: HelperLocale.of(context).titleSport),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SportSelectorDropdown(
                selectedSport: team.sport,
                onSportChanged: (sport) {
                  bloc.updateTeamSport(sport);
                },
              ),
            ),

            /// Team Name
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _Title(
                name: HelperLocale.of(context).titleName,
              ),
            ),
            const SizedBox(height: 10),
            DecoratedInputView(
              hint: HelperLocale.of(context).hintEnterName,
              text: team.name,
              onValueChanged: (newName) {
                bloc.updateName(newName);
              },
              validator: (value) {
                return isNotNullOrEmpty(context, value);
              },
            ),

            /// Team City
            _Title(name: HelperLocale.of(context).titleCity),
            const SizedBox(height: 10),
            DecoratedInputView(
              text: team.city,
              hint: HelperLocale.of(context).hintEnterCity,
              onValueChanged: (newCity) {
                bloc.updateCity(newCity);
              },
              validator: (value) {
                return isNotNullOrEmpty(context, value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _Title(
                      name: HelperLocale.of(context).titleLogo,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _Title(
                      name: HelperLocale.of(context).titleColor,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _LogoSelector(
                  team: team,
                  onLogoSelected: (logo) {
                    bloc.updateTeamLogo(logo);
                  },
                ),
                const SizedBox(width: 24),
                _ColorSelector(
                  team: team,
                  onColorSelected: (color) {
                    bloc.updateTeamColor(color);
                  },
                ),
              ],
            ),
            _OperationButtons(
              onSave: () {
                bloc.saveTeam();
              },
            )
          ],
        ),
      ),
    );
  }
}

class DecoratedInputView extends StatelessWidget {
  const DecoratedInputView({
    Key? key,
    required this.hint,
    this.text,
    required this.onValueChanged,
    this.validator,
  }) : super(key: key);

  final String hint;
  final String? text;
  final ValueChanged<String> onValueChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return InputView(
      text: text ?? "",
      hint: hint.toLowerCase(),
      textColor: ThemeHolder.of(context).main,
      fillColor: ThemeHolder.of(context).background1,
      borderColor: ThemeHolder.of(context).secondary1,
      hintColor: ThemeHolder.of(context).secondary2,
      onValueChanged: onValueChanged,
      validator: validator,
    );
  }
}

class _TopBar extends StatelessWidget {
  final Team team;
  final String? title;

  const _TopBar({
    Key? key,
    required this.team,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title ?? HelperLocale.of(context).titleNewTeam;
    final isNewTeam = title == null;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isNewTeam)
          const SizedBox(
            height: 45,
            width: 45,
          ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: ThemeHolder.of(context)
                  .textStyle
                  .h1(color: ThemeHolder.of(context).main),
            ),
          ),
        ),
        if (!isNewTeam)
          DeleteButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (builderContext) {
                  final width = MediaQuery.of(context).size.height;
                  return AppDialog(
                    child: SizedBox(
                      width: width,
                      child: DeleteDialog(
                        team: team,
                        onAccept: () {
                          BlocProvider.of<TeamsBloc>(context)
                              .add(DeleteTeam(id: team.uid));

                          var count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                        },
                        onDecline: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
      ],
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
    final color = ThemeHolder.of(context).secondary2;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2),
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context).textStyle.t1(color: color),
      ),
    );
  }
}

class _LogoSelector extends StatelessWidget {
  final Team? team;

  const _LogoSelector({
    Key? key,
    required this.team,
    required this.onLogoSelected,
  }) : super(key: key);

  final ValueChanged<Logo> onLogoSelected;

  @override
  Widget build(BuildContext context) {
    final selectedLogo = team?.logo ?? Logo.shield2;
    final selectedTeamColor = team?.teamColor ?? TeamColor.gunMetalGrey;
    final selectedColor =
        ThemeHolder.of(context).fromTeamColor(selectedTeamColor);

    return _SelectorWidget(
      child: _LogoSelectorIcon(
        teamColor: team?.teamColor ?? TeamColor.gunMetalGrey,
        logo: team?.logo ?? Logo.shield1,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (builderContext) {
            final width = MediaQuery.of(context).size.height;
            return AppDialog(
              child: SizedBox(
                width: width,
                child: DialogLogoSelectorView(
                  currentColor: selectedColor,
                  selectedLogo: selectedLogo,
                  onLogoSelected: (logo) {
                    onLogoSelected.call(logo);
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
    required this.onColorSelected,
  }) : super(key: key);

  final ValueChanged<TeamColor> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return _SelectorWidget(
      child: _ColorSelectorIcon(
        color: team?.teamColor ?? TeamColor.gunMetalGrey,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (builderContext) {
            final width = MediaQuery.of(context).size.height;
            return AppDialog(
              child: SizedBox(
                width: width,
                child: DialogColorSelectorView(
                  currentColor: team?.teamColor ?? TeamColor.gunMetalGrey,
                  onColorSelected: (color) {
                    onColorSelected.call(color);
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
  const _OperationButtons({
    Key? key,
    required this.onSave,
    this.onCancel,
  }) : super(key: key);

  final VoidCallback onSave;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuButton(
            title: HelperLocale.of(context).buttonSave,
            color: ThemeHolder.of(context).main,
            onPress: () {
              if ((_formKey.currentState as FormState).validate()) {
                onSave.call();
                Navigator.of(context).pop();
              }
            }),
        const SizedBox(height: 12),
        MenuButton(
          title: HelperLocale.of(context).buttonCancel,
          color: ThemeHolder.of(context).warning,
          onPress: () {
            onCancel?.call();
            Navigator.of(context).pop();
          },
        )
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
        color: ThemeHolder.of(context).background1,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        child: InkWell(
          highlightColor: ThemeHolder.of(context).secondary1.withOpacity(0.05),
          splashColor: ThemeHolder.of(context).secondary1.withOpacity(0.1),
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
                  color: ThemeHolder.of(context).secondary2,
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
                color: ThemeHolder.of(context).cardShadow,
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
