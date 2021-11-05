import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

typedef OnDoubleButtonClicked = void Function(
    String parameterId, HostStatus hostStatus, int delta);

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    Key? key,
    required this.color,
    required this.height,
    required this.width,
    this.borderWidth = 2,
    required this.plusClicked,
    required this.minusClicked,
  }) : super(key: key);

  final Color color;
  final double borderWidth;
  final double height;
  final double width;
  final VoidCallback plusClicked;
  final VoidCallback minusClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: borderWidth),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildExpandedButton(
                Icon(Icons.remove_rounded, color: color), 2, minusClicked),
            Container(width: borderWidth, height: height, color: color),
            _buildExpandedButton(
                Icon(Icons.add_outlined, color: color), 3, plusClicked),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedButton(Widget child, int flex, VoidCallback callback) {
    return Expanded(
      flex: flex,
      child: Material(
        color: Colors.transparent,
        child: InkResponse(
          onTap: callback,
          splashColor: color.withOpacity(0.5),
          highlightColor: color.withOpacity(0.1),
          child: Center(child: child),
        ),
      ),
    );
  }
}
