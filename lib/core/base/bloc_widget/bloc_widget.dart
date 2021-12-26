import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/bloc/base_cubit.dart';

abstract class WidgetBloc<T extends CubitCustom> extends StatelessWidget {
  final T? blocValue;

  final bool handleBlocValueClose;

  const WidgetBloc({
    Key? key,
    this.blocValue,
    this.handleBlocValueClose = false,
  }) : super(key: key);

  T findBloc(BuildContext context) {
    return BlocProvider.of<T>(context);
  }

  Widget buildUI(BuildContext context, T bloc);

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    var child = Builder(builder: (context) {
      return Builder(builder: (context) {
        return BlocListener<BlocContext, Function(BuildContext context)?>(
          bloc: findBloc(context).contextable,
          child: buildUI(context, findBloc(context)),
          listener: (context, function) {
            if (function != null) {
              function(context);
            }
          },
        );
      });
    });

    return blocValue != null && !handleBlocValueClose
        ? BlocProvider<T>.value(
            value: blocValue!..contextable.connectedToContext = true,
            child: child,
          )
        : BlocProvider(
            create: (BuildContext context) {
              if (blocValue != null) {
                return blocValue!..contextable.connectedToContext = true;
              } else {
                return context.appBloc.dependencies<T>()
                  ..contextable.connectedToContext = true;
              }
            },
            child: child,
          );
  }
}
