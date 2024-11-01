import 'package:flutter/material.dart';

class AppCoachBottomRightIndicatorPainter extends CustomPainter {
  final Color color;
  final double? radius;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double triangleSide;
  final double rightSpace;

  AppCoachBottomRightIndicatorPainter({
    this.color = Colors.white,
    this.radius,
    this.rightSpace = 24,
    this.topLeftRadius = 8,
    this.topRightRadius = 8,
    this.bottomLeftRadius = 8,
    this.bottomRightRadius = 8,
    this.triangleSide = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    var path = Path()
      ..moveTo(radius ?? topLeftRadius, 0)
      ..quadraticBezierTo(0, 0, 0, radius ?? topLeftRadius)
      ..lineTo(0, size.height - (radius ?? topLeftRadius) - triangleSide)
      ..quadraticBezierTo(
          0, size.height - triangleSide, (radius ?? bottomLeftRadius), size.height - triangleSide)
      ..lineTo(size.width - rightSpace - 40, size.height - triangleSide)
      ..lineTo(size.width - rightSpace - 20, size.height)
      ..lineTo(size.width - rightSpace, size.height - triangleSide)
      ..lineTo(size.width - (radius ?? bottomRightRadius), size.height - triangleSide)
      ..quadraticBezierTo(size.width, size.height - triangleSide, size.width,
          size.height - triangleSide - (radius ?? bottomRightRadius))
      ..lineTo(size.width, (radius ?? topRightRadius))
      ..quadraticBezierTo(size.width, 0, size.width - (radius ?? topRightRadius), 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AppCoachBottomRightIndicatorPainter oldDelegate) => true;
}
