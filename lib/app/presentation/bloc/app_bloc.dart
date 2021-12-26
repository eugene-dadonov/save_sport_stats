import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_stats_live/core/base/navigation/navigation_bloc.dart';

class AppBlocState {}

extension FindAppBloc on BuildContext {
  AppBloc get appBloc => BlocProvider.of<AppBloc>(this);
}

AppBloc findAppBloc(BuildContext context) {
  return BlocProvider.of<AppBloc>(context);
}

class AppBloc extends Cubit<AppBlocState> {
  final GetIt dependencies;

  final BlocNavigator navigator;

  AppBloc({
    required this.dependencies,
    required this.navigator,
  }) : super(AppBlocState());

  @override
  Future<void> close() {
    return super.close();
  }
}
