import 'package:flutter/material.dart';

class ChamferClipPath extends CustomClipper<Path> {
  final double radius;

  ChamferClipPath({required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(radius, 0)
      ..lineTo(size.width - size.height / 4, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(radius, size.height)
      ..relativeArcToPoint(Offset(-radius, -radius),
          radius: Radius.circular(radius))
      ..lineTo(0, radius)
      ..relativeArcToPoint(Offset(radius, -radius),
          radius: Radius.circular(radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
