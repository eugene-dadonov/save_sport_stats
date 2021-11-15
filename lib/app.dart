import 'package:flutter/material.dart';
import 'core/theming/domain/presentation/app_theme.dart';
import 'features/screen_home/presentation/page/home_page.dart';
import 'features/screen_menu/presentation/page/menu_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        )
      ),
        title: 'Sport Stats Live', home: HomeScreen());
  }
}
