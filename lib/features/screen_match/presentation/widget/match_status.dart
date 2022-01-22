import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';

class MatchStatus extends StatelessWidget {
  const MatchStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  final Status status;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ActiveMatch extends StatelessWidget {
  const ActiveMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Матч идет",
          style: ThemeHolder.of(context)
              .textStyle
              .h1(color: ThemeHolder.of(context).main),
        ),
        const SizedBox(width: 6),
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ThemeHolder.of(context).warning),
          width: 12,
          height: 12,
        ),
      ],
    );
  }
}

class _AnimatedDot extends StatefulWidget {
  const _AnimatedDot();

  @override
  _AnimatedContainer createState() => _AnimatedContainer();
}

class _AnimatedContainer extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 10, end: 15).animate(_controller);

    _animation.addListener(() {
      setState(() {});
    });
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: ThemeHolder.of(context).warning),
      width: _animation.value,
      height: _animation.value,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
