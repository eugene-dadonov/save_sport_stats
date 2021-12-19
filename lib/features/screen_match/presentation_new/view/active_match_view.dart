import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/match_status_selector/match_status_selector_drop.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/widget/parameter_card/parameter_card.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/widget/table.dart';

class ActiveMatchView extends StatelessWidget {
  final Match match;

  const ActiveMatchView({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHolder.of(context).background1,
      appBar: AppBar(
        backgroundColor: ThemeHolder.of(context).card,
        iconTheme: IconThemeData(color: ThemeHolder.of(context).main),
        elevation: 2,
        shadowColor: ThemeHolder.of(context).cardShadow.withOpacity(0.3),
        title: SportSelectorDropdown(
          selectedStatus: match.status,
          onStatusChanged: (status) {
            BlocProvider.of<MatchScreenBloc>(context)
                .add(UpdateStatusEvent(status: status));
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ScoreTable(match: match),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 7)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  child: AttributeCard(
                    attribute: match.attributes[index],
                    teamOne: match.host,
                    teamTwo: match.guest,
                  ),
                );
              },
              childCount: match.attributes.length,
            ),
          )
        ],
      ),
    );
  }
}
