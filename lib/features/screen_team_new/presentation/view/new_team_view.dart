import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/color_selector.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/logo_selector.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class NewTeamView extends StatelessWidget {
  const NewTeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            _buildTitle("Название"),
            _buildInputElement(
              hint: 'Введите название',
              onValueChanged: (value) {},
            ),
            _buildTitle("Город"),
            _buildInputElement(
              hint: 'Введите город',
              onValueChanged: (value) {},
            ),
            _buildTitle("Выберите эмблему"),
            _buildLogoSelector(context),
            _buildTitle("Выберите цвет"),
            _buildColorSelector(context),
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
    required ValueChanged<String> onValueChanged,
    FormFieldValidator<String>? validator,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: 50,
          child: InputView(
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

  SliverToBoxAdapter _buildLogoSelector(BuildContext context) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: LogoSelector(
            currentColor: AppColors.red,
            selectedLogo: Logo.rombus2,
            onLogoSelected: (logo) {
              print(logo);
            },
          ),
        ),
      );

  SliverToBoxAdapter _buildColorSelector(BuildContext context) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ColorSelector(
            selectedColor: TeamColor.red,
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
            child: Text('Сохранить'),
          ),
        ),
      );
}
