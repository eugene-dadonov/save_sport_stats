import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/match_status_selector/match_status_selector_drop.dart';
import 'package:sport_stats_live/features/screen_match/presentation/widget/parameter_card/parameter_card.dart';
import 'package:sport_stats_live/features/screen_match/presentation/widget/table.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/bloc/cubit_match_screen.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';

class ScreenMatches extends WidgetBloc<BlocMatchScreen> {
  const ScreenMatches({Key? key /*, required BlocMatchScreen bloc*/
      })
      : super(
          key: key,
/*          blocValue: bloc,
          handleBlocValueClose: true,*/
        );

  @override
  Widget buildUI(BuildContext context, BlocMatchScreen bloc) {
    return BlocBuilder<BlocMatchScreen, ViewState>(
      builder: (_, state) {
        if (state is MatchContent) {
          return ActiveMatchView(
            match: state.match,
            bloc: bloc,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ActiveMatchView extends StatelessWidget {
  final BlocMatchScreen bloc;
  final Match match;

  const ActiveMatchView({
    Key? key,
    required this.match,
    required this.bloc,
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
            bloc.updateStatus();
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ScoreTable(
              match: match,
              onScoreUpdated: (hostStatus, delta) => bloc.updateScore(
                hostStatus: hostStatus,
                delta: delta,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 7)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  child: AttributeCard(
                    attribute: match.attributes[index],
                    teamOne: match.host,
                    teamTwo: match.guest,
                    onAttributeUpdated: (parameterId, hostStatus, delta) {
                      bloc.updateParameter(
                        parameterId: parameterId,
                        hostStatus: hostStatus,
                        delta: delta,
                      );
                    },
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

class MatchInfoDetails extends StatelessWidget {
  final Match match;
  final BlocMatchScreen bloc;

  const MatchInfoDetails({
    Key? key,
    required this.match,
    required this.bloc,
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
            bloc.updateStatus();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScoreTable(match: match),
            ListView.separated(
              itemBuilder: (context, index) {
                return AttributeCard(
                  attribute: match.attributes[index],
                  teamOne: match.host,
                  teamTwo: match.guest,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: match.attributes.length,
            ),
          ],
        ),
      ),
    );
  }
}
