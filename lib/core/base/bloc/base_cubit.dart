import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCustom<T> extends Cubit<T> {
  BlocContext contextable = BlocContext(null);

  CubitCustom(T state) : super(state);

  @override
  Future<void> close() {
    contextable.close();
    return super.close();
  }
}

class BlocContext extends Cubit<Function(BuildContext context)?> {
  bool connectedToContext = false;

  BlocContext(Function(BuildContext context)? initialState)
      : super(initialState);

  run(Function(BuildContext context) function) {
    emit(function);
  }
}
