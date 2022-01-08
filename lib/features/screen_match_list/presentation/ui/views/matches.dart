import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_matches_view.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/widget/match_card/match_card_new.dart';

const double _defaultHeight = 200;

class ViewMatches extends WidgetBloc<BlocMatchesView> {
  const ViewMatches({
    Key? key,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.matchGap = 0.0,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double matchGap;

  @override
  Widget buildUI(BuildContext context, BlocMatchesView bloc) {
    return BlocBuilder<BlocMatchesView, ViewState>(
      builder: (_, state) {
        if (state is LoadingState) {
          return const _LoadingView();
        } else if (state is MatchesContentState) {
          return _MatchListView(
            matches: state.matches,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            matchGap: matchGap,
          );
        } else if (state is EmptyState) {
          return const _EmptyView();
        } else if (state is ErrorState) {
          return _ErrorView(errorMessage: state.errorMessage);
        } else {
          return const _ErrorView(errorMessage: "Неизвестная ошибка");
        }
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: _defaultHeight,

      /// TODO: Заменить на нормальную загрузку
      child: CircularProgressIndicator(),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      child: Center(
        child: Text(
          "У вас еще нет матчей.\nДобавьте их скорее!",
          style: ThemeHolder.of(context).textStyle.h3(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      child: Center(
        child: Text(
          errorMessage,
          style: ThemeHolder.of(context).textStyle.h3(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _MatchListView extends StatelessWidget {
  final List<Match> matches;

  const _MatchListView({
    Key? key,
    required this.matches,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.matchGap = 0.0,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double matchGap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: matches.length,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      itemBuilder: (context, index) {
        return MatchCard(
          match: matches[index],
          callback: () {},
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: matchGap);
      },
    );
  }
}
