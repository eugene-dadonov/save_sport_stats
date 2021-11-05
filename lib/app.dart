import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/page/match_list_page.dart';



import 'features/screen_match/presentation/pages/match_page.dart';
import 'features/screen_menu/presentation/page/menu_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Sport Stats Live', home: MenuPage());
  }
}
