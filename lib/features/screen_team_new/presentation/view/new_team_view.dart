import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/color_selector.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/logo_selector.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class NewTeamView extends StatelessWidget {
  final Team? team;

  const NewTeamView({Key? key, required this.team}) : super(key: key);

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
              onValueChanged: (value) {},
            ),
            _buildTitle("Город"),
            _buildInputElement(
              text: team?.city,
              hint: 'Введите город',
              onValueChanged: (value) {},
            ),
            _buildTitle("Выберите эмблему"),
            _buildLogoSelector(
              context: context,
              logo: team?.logo ?? Logo.round,
              teamColor: team?.teamColor ?? TeamColor.black,
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

  SliverToBoxAdapter _buildLogoSelector({
    required BuildContext context,
    required Logo logo,
    required TeamColor teamColor,
  }) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: LogoSelector(
            currentColor: teamColor.toColor(),
            selectedLogo: logo,
            onLogoSelected: (logo) {
              print(logo);
            },
          ),
        ),
      );

  SliverToBoxAdapter _buildColorSelector(
          BuildContext context, TeamColor teamColor) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ColorSelector(
            selectedColor: teamColor,
            onColorSelected: (value) {
              print(value);
            },
          ),
        ),
      );

  SliverToBoxAdapter _buildSaveButton(BuildContext context) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: TextButton(
            onPressed: () {},
            child: const Text('Сохранить'),
          ),
        ),
      );
}
