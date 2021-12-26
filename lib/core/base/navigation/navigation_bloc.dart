import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'base_route.dart';

class BlocNavigatorState extends Equatable {
  @override
  List<Object> get props => [];
}

class BlocNavNavigating extends BlocNavigatorState {}

class BlocNavNavigatingToRoute extends BlocNavNavigating {
  final BaseRoute route;

  BlocNavNavigatingToRoute(this.route);
}

class BlocNavNavigateToDefault extends BlocNavNavigatingToRoute {
  BlocNavNavigateToDefault(BaseRoute route) : super(route);
}

class BlocNavNavigateToPush extends BlocNavNavigatingToRoute {
  BlocNavNavigateToPush(BaseRoute route) : super(route);
}

class BlocNavNavigateToRemove extends BlocNavNavigatingToRoute {
  BlocNavNavigateToRemove(BaseRoute route) : super(route);
}

class BlocNavNavigateToReplace extends BlocNavNavigatingToRoute {
  BlocNavNavigateToReplace(BaseRoute route) : super(route);
}

class BlocNavPop extends BlocNavNavigating {
  final dynamic data;

  BlocNavPop(this.data);
}

class BlocNavShowSnackBar extends BlocNavNavigating {
  final String text;

  BlocNavShowSnackBar(this.text);
}

class BlocNavigator extends Cubit<BlocNavigatorState> {
  BlocNavigator() : super(BlocNavigatorState());

  goToRemoveAll(BaseRoute route) {
    emit(BlocNavNavigateToRemove(route));
    emit(BlocNavigatorState());
  }

  goTo(BaseRoute route, {bool useDefaultPushType = true}) {
    if (useDefaultPushType) {
      emit(BlocNavNavigateToDefault(route));
    } else {
      emit(BlocNavNavigateToPush(route));
    }
    emit(BlocNavigatorState());
  }

  goToReplacement(BaseRoute route) {
    emit(BlocNavNavigateToReplace(route));
    emit(BlocNavigatorState());
  }

  showSnackBar(String text) {
    emit(BlocNavShowSnackBar(text));
    emit(BlocNavigatorState());
  }

  pop(dynamic data) {
    emit(BlocNavPop(data));
    emit(BlocNavigatorState());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
