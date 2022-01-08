import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/widget/match_card/match_card_new.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

class MatchListView extends StatelessWidget {
  final List<Match> matches;

  const MatchListView({
    Key? key,
    required this.matches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: StrokeFlatButton(
                text: HelperLocale.of(context).buttonNewMatch,
                onPress: () {},
                height: 100,
                color: ThemeHolder.of(context).secondary1,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final Match match = matches[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: MatchCard(
                    match: match,
                    callback: () {},
                  ),
                );
              },
              childCount: matches.length,
            ),
          ),
        ],
      ),
    );
  }
}
