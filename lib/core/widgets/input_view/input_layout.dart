import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';

class InputView extends StatefulWidget {
  final String text;
  final String hint;
  final ValueChanged<String> onValueChanged;
  final FormFieldValidator<String>? validator;
  final Color hintColor;
  final Color textColor;
  final Color fillColor;
  final Color borderColor;

  const InputView({
    Key? key,
    required this.text,
    required this.hint,
    required this.onValueChanged,
    this.validator,
    required this.hintColor,
    required this.textColor,
    required this.fillColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {

  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    textController.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: AppStyle.h1(size: 18, color: widget.textColor),
      textAlign: TextAlign.center,
      onChanged: widget.onValueChanged,
      validator: widget.validator,
      decoration: _buildDecoration(),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      hintText: widget.hint.toUpperCase(),
      fillColor: widget.fillColor,
      focusColor: AppColors.background,
      hintStyle: AppStyle.h1(size: 16, color: widget.hintColor),
      filled: true,
      focusedBorder: _buildBorder(color: widget.borderColor, width: 2),
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
