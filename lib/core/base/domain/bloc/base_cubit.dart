import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/navigation/navigation_bloc.dart';

class CubitCustom<T> extends Cubit<T> {
  BlocContext contextable = BlocContext(null);

  CubitCustom(T state) : super(state);

  @override
  Future<void> close() {
    contextable.close();
    return super.close();
  }
}

abstract class CubitCell<T> extends CubitCustom<T> {
  final AppBloc app;

  BlocNavigator get navigator => app.navigator;

  CubitCell(this.app, T state) : super(state);
}

class BlocContext extends Cubit<Function(BuildContext context)?> {
  bool connectedToContext = false;

  BlocContext(Function(BuildContext context)? initialState)
      : super(initialState);

  run(Function(BuildContext context) function) {
    emit(function);
  }
}
