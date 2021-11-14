import 'package:flutter/material.dart';
import 'features/screen_home/presentation/page/home_page.dart';
import 'features/screen_menu/presentation/page/menu_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Sport Stats Live', home: HomeScreen());
  }
}
