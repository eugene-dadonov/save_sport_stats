import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/screen_home/presentation/page/home.dart';
import 'package:sport_stats_live/features/screen_home/presentation/page/home_page.dart';
import '../../../core/theming/domain/presentation/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
        return AppLocalizations.of(context)!.titleApp;
      },
      home: HomeScreen(),
    );
  }
}
