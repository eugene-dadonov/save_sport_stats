import 'package:equatable/equatable.dart';

abstract class BaseRoute extends Equatable {
  final String nameOfRoute;
  final PushType pushType;
  final AuthState authType;

  const BaseRoute(
    this.nameOfRoute, {
    this.pushType = PushType.common,
    this.authType = AuthState.requiredLogIn,
  });

  @override
  List<Object?> get props => [nameOfRoute, pushType];
}

enum PushType {
  removeAll,
  replace,
  common,
}

enum AuthState {
  requiredLogOut,
  requiredLogIn,
  noCare,
}
