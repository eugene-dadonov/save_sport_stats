import 'package:flutter/material.dart';

class LoadingStubView extends StatelessWidget {
  final double height;

  const LoadingStubView({
    Key? key,
    this.height = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,

      /// TODO: Заменить на нормальную загрузку
      child: const CircularProgressIndicator(),
    );
  }
}
