import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';

class NewTeamPage extends StatelessWidget {
  const NewTeamPage({Key? key}) : super(key: key);

  static Route route({required TeamsBloc teamsBloc}) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: teamsBloc,
        child: NewTeamPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
