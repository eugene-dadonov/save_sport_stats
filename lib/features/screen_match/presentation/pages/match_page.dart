import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_match/presentation/widgets/attributes/attribute_widget.dart';
import 'package:sport_stats_live/features/screen_match/presentation/widgets/table/table.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({
    Key? key,
    this.matchId,
  }) : super(key: key);

  final String? matchId;

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (BuildContext context) =>
            MatchBloc(matchRepository: context.read<MatchRepositoryImpl>())
              ..add(InitialEvent(matchId: widget.matchId)),
        child: BlocBuilder<MatchBloc, MatchState>(
            builder: (BuildContext context, MatchState state) {
          if (state is OnMatch) {
            return CustomScrollView(
              slivers: [
                _buildAppBar(context),
                _buildTable(context, state),
                _buildParameters(context, state)
              ],
            );
          } else if (state is OnError) {
            return Center(child: Text(state.message));
          } else if (state is OnNoActiveMatch) {
            return const Center(child: Text("Нет активного матча!"));
          } else {
            return const Center(child: Text("Что-то странное"));
          }
        }),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      title: Text(
        "Sport\nStats\nLive",
        style: GoogleFonts.russoOne(fontSize: 10, color: AppColors.blueDark),
      ),
    );
  }

  Widget _buildTable(BuildContext context, OnMatch state) {
    return SliverToBoxAdapter(
      child: TableWidget(
        host: state.match.host,
        guest: state.match.guest,
        hostScore: 1,
        guestScore: 2,
      ),
    );
  }

  Widget _buildParameters(BuildContext context, OnMatch state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildParameterWidget(context, index, state);
        },
        childCount: state.match.attributes.length,
      ),
    );
  }

  Widget _buildParameterWidget(BuildContext context, int index, OnMatch state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: AttributeWidget(
        host: state.match.host,
        guest: state.match.guest,
        attribute: state.match.attributes[index],
        onPlusClicked: (String parameterId, HostStatus hostStatus, int delta) {
          context.read<MatchBloc>().add(OnParameterChangedEvent(
                parameterId: parameterId,
                delta: delta,
                hostStatus: hostStatus,
              ));
        },
        onMinusClicked: (String parameterId, HostStatus hostStatus, int delta) {
          context.read<MatchBloc>().add(OnParameterChangedEvent(
                parameterId: parameterId,
                delta: delta,
                hostStatus: hostStatus,
              ));
        },
      ),
    );
  }
}
