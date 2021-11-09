import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';

class InputView extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onValueChanged;
  final FormFieldValidator<String>? validator;
  final Color hintColor;
  final Color textColor;
  final Color fillColor;
  final Color borderColor;

  const InputView({
    Key? key,
    required this.hint,
    required this.onValueChanged,
    this.validator,
    required this.hintColor,
    required this.textColor,
    required this.fillColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: AppStyle.h1(size: 18, color: textColor),
        textAlign: TextAlign.center,
        onChanged: onValueChanged,
        validator: validator,
        decoration: _buildDecoration());
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      hintText: hint.toUpperCase(),
      fillColor: fillColor,
      focusColor: AppColors.background,
      hintStyle: AppStyle.h1(size: 16, color: hintColor),
      filled: true,
      focusedBorder: _buildBorder(color: borderColor, width: 2),
      enabledBorder: _buildBorder(color: Colors.transparent, width: 2),
    );
  }

  OutlineInputBorder _buildBorder({
    required Color color,
    required double width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide:
          BorderSide(style: BorderStyle.solid, color: color, width: width),
    );
  }
}
