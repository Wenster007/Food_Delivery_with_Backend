import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';

class CircularLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CircularLinePainter({required this.color, this.strokeWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.width / 2);
    final radius = size.width / 2  + Dimensions.height * 0.008;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
