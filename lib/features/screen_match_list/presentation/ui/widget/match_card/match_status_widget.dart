import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

class MatchStatusWidget extends StatelessWidget {
  final Status status;

  const MatchStatusWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.inProcess:
        return const _InProcessStatusWidget();
      case Status.finished:
        return const _FinishedStatusWidget();
      case Status.notStarted:
        return const _NotStartedStatusWidget();
      case Status.canceled:
        return const _CancelledStatusWidget();
    }
  }
}

class _InProcessStatusWidget extends StatelessWidget {
  const _InProcessStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = ThemeHolder.of(context).main;
    final circleColor = ThemeHolder.of(context).warning;
    return _StatusCard(
      cardColor: ThemeHolder.of(context).card,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Status.inProcess.toName(context),
            style: ThemeHolder.of(context).textStyle.h5(color: textColor),
          ),
          const SizedBox(width: 4),
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              color: circleColor,
            ),
          )
        ],
      ),
    );
  }
}

class _FinishedStatusWidget extends StatelessWidget {
  const _FinishedStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatusCard(
      cardColor: ThemeHolder.of(context).card,
      child: Text(
        Status.finished.toName(context),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context)
            .textStyle
            .h5(color: ThemeHolder.of(context).secondary2),
      ),
    );
  }
}

class _NotStartedStatusWidget extends StatelessWidget {
  const _NotStartedStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatusCard(
      cardColor: ThemeHolder.of(context).card,
      child: Text(
        Status.notStarted.toName(context),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context)
            .textStyle
            .h5(color: ThemeHolder.of(context).main),
      ),
    );
  }
}

class _CancelledStatusWidget extends StatelessWidget {
  const _CancelledStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatusCard(
      cardColor: ThemeHolder.of(context).attention,
      child: Text(
        Status.canceled.toName(context),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context)
            .textStyle
            .h5(color: ThemeHolder.of(context).warning),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final Color cardColor;
  final Widget child;

  const _StatusCard({
    Key? key,
    required this.cardColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
          alignment: Alignment.center,
          child: child),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: cardColor,
      ),
    );
  }
}

extension StatusX on Status {
  String toName(BuildContext context) {
    switch(this) {
      case Status.inProcess:
        return HelperLocale.of(context).statusInProgress;
    case Status.finished:
      return HelperLocale.of(context).statusFinished;
      case Status.notStarted:
        return HelperLocale.of(context).statusNotStarted;
      case Status.canceled:
        return HelperLocale.of(context).statusCancelled;
    }
  }
}
