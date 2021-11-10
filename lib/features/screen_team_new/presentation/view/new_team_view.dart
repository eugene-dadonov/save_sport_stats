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
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/dialog_logo.dart';
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
          physics: const ClampingScrollPhysics(),
          slivers: [
            _buildTitle("Название"),
            _buildInputElement(
              hint: 'Введите название',
              text: team?.name,
              onValueChanged: (newName) {
                BlocProvider.of<TeamEditBloc>(context)
                    .add(UpdateNameEvent(newName));
              },
            ),
            _buildTitle("Город"),
            _buildInputElement(
              text: team?.city,
              hint: 'Введите город',
              onValueChanged: (newCity) {
                BlocProvider.of<TeamEditBloc>(context)
                    .add(UpdateCityEvent(newCity));
              },
            ),
            _buildTitle("Выберите эмблему"),
            SliverToBoxAdapter(
              child: _SelectLogoWidget(
                selectedLogo: team?.logo ?? Logo.round,
                currentColor:
                    team?.teamColor.toColor() ?? TeamColor.black.toColor(),
              ),
            ),
            _buildTitle("Выберите цвет"),
            _buildColorSelector(context, team?.teamColor ?? TeamColor.black),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTitle(String name) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            name.toUpperCase(),
            style: AppStyle.h1(size: 14),
          ),
        ),
      );

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

  SliverToBoxAdapter _buildColorSelector(
          BuildContext context, TeamColor teamColor) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ColorSelector(
            selectedColor: teamColor,
            onColorSelected: (color) {
              BlocProvider.of<TeamEditBloc>(context)
                  .add(UpdateColorEvent(color));
            },
          ),
        ),
      );

  SliverToBoxAdapter _buildSaveButton(BuildContext context) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: TextButton(
            onPressed: () {
              BlocProvider.of<TeamEditBloc>(context).add(SaveTeamEvent());
              Navigator.of(context).pop();
            },
            child: const Text('Сохранить'),
          ),
        ),
      );
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
                  child: LogoSelectorView(
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
            padding: const EdgeInsets.all(16.0),
            child: LogoIcon(logo: selectedLogo, color: currentColor, height: 100),
          ),
        ),
      ),
    );
  }
}
