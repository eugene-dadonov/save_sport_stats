import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sport_stats_live/features/di.dart';
import 'package:sport_stats_live/features/screen_home/presentation/home_screen.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';
import '../../../core/theming/domain/presentation/app_theme.dart';
import 'bloc/app_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.di,
  }) : super(key: key);

  final DependencyInjector di;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.dependencies<AppBloc>(),
      child: BlocBuilder<AppBloc, AppBlocState>(
        builder: (cont, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: HelperLocale.delegate.supportedLocales,
            localizationsDelegates: const [
              HelperLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              highlightColor: ThemeHolder.of(context).main.withOpacity(0.2),
              backgroundColor: ThemeHolder.of(context).background1,
              primaryIconTheme: IconThemeData(
                color: ThemeHolder.of(context).ok,
                size: 30,
              ),
              iconTheme: IconThemeData(
                color: ThemeHolder.of(context).main,
                size: 30,
              ),
            ),
            onGenerateTitle: (context) {
              return HelperLocale.of(context).titleApp;
            },
            home: HomeScreen(),
            // home: Container(color: Colors.red),
          );
        },
      ),
    );
  }
}
