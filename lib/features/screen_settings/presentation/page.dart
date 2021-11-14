import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHolder.of(context).background1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeHolder.of(context).card,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                title: Text(
                  'Темная тема',
                  style: ThemeHolder.of(context).textStyle.h3(),
                ),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
