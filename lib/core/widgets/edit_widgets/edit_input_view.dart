import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';

class EditInputView extends StatelessWidget {
  const EditInputView({
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
