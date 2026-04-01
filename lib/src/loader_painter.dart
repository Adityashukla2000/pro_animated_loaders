import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'loader_types.dart';

/// **LoaderPainterFactory** is the internal engine of the package.
///
/// It uses the Factory Pattern to map each [LoaderType] to its
/// respective [CustomPainter] implementation.
class LoaderPainterFactory {
  /// Returns the appropriate [CustomPainter] based on the provided [type].
  static CustomPainter getPainter(
    LoaderType type,
    double value,
    Color color,
    double sw,
  ) {
    switch (type) {
      case LoaderType.pulse:
        return _PulsePainter(value, color);
      case LoaderType.spinningRing:
        return _RingPainter(value, color, sw);
      case LoaderType.glowingArc:
        return _GlowPainter(value, color, sw);
      case LoaderType.dots:
        return _DotsPainter(value, color);
      case LoaderType.dualRing:
        return _DualRingPainter(value, color, sw);
      case LoaderType.chasingDots:
        return _ChasingDotsPainter(value, color);
      case LoaderType.hourGlass:
        return _HourGlassPainter(value, color);
      case LoaderType.ripple:
        return _RipplePainter(value, color, sw);
      case LoaderType.jumpingDots:
        return _JumpingDotsPainter(value, color);
      case LoaderType.shimmer:
        return _ShimmerPainter(value, color, sw);
    }
  }
}

/// Base class for all loaders to ensure consistent [shouldRepaint] logic.
abstract class _BasePainter extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Draws a growing circle that fades out.
class _PulsePainter extends _BasePainter {
  final double v;
  final Color c;
  _PulsePainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      size.center(Offset.zero),
      (size.width / 2) * v,
      Paint()..color = c.withValues(alpha: 1 - v),
    );
  }
}

/// Draws a simple rotating arc/ring.
class _RingPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _RingPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = c
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset.zero & size, v * 2 * math.pi, 2.5, false, p);
  }
}

/// Draws an arc with a sweep gradient for a "glowing" effect.
class _GlowPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _GlowPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..shader = SweepGradient(
        colors: [Colors.transparent, c],
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..strokeCap = StrokeCap.round;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(v * 2 * math.pi);
    canvas.translate(-size.width / 2, -size.height / 2);
    canvas.drawArc(Offset.zero & size, 0, math.pi * 1.5, false, p);
    canvas.restore();
  }
}

/// Draws three dots that scale up and down using a sine wave.
class _DotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _DotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 3; i++) {
      double s = math.sin((v + i * 0.2) * math.pi).abs();
      canvas.drawCircle(
        Offset((size.width / 4) * (i + 1), size.height / 2),
        (size.width / 10) * s,
        Paint()..color = c,
      );
    }
  }
}

/// Draws two rings rotating in opposite directions.
class _DualRingPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _DualRingPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = c
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw;
    canvas.drawArc(Offset.zero & size, v * 2 * math.pi, 2, false, p);
    canvas.drawArc(
      Offset.zero & size,
      -v * 2 * math.pi,
      2,
      false,
      Paint()
        ..color = c.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = sw,
    );
  }
}

/// Draws dots that chase each other in a circular path.
class _ChasingDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _ChasingDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (int i = 0; i < 5; i++) {
      final angle = (v * 2 * math.pi) + (i * 0.6);
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * (size.width / 2.5),
          center.dy + math.sin(angle) * (size.width / 2.5),
        ),
        4,
        Paint()..color = c.withValues(alpha: 1 - (i * 0.15)),
      );
    }
  }
}

/// Draws a classic hourglass shape that rotates.
class _HourGlassPainter extends _BasePainter {
  final double v;
  final Color c;
  _HourGlassPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(v * math.pi);
    canvas.drawPath(
      Path()
        ..moveTo(-12, -12)
        ..lineTo(12, -12)
        ..lineTo(0, 0)
        ..close(),
      Paint()..color = c,
    );
    canvas.drawPath(
      Path()
        ..moveTo(-12, 12)
        ..lineTo(12, 12)
        ..lineTo(0, 0)
        ..close(),
      Paint()..color = c.withValues(alpha: 0.4),
    );
  }
}

/// Draws concentric rings that ripple outwards.
class _RipplePainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _RipplePainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 3; i++) {
      double val = (v + i * 0.33) % 1.0;
      canvas.drawCircle(
        size.center(Offset.zero),
        (size.width / 2) * val,
        Paint()
          ..color = c.withValues(alpha: 1 - val)
          ..style = PaintingStyle.stroke
          ..strokeWidth = sw,
      );
    }
  }
}

/// Draws dots that jump up and down in a sequence.
class _JumpingDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _JumpingDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 3; i++) {
      double y = math.sin((v + i * 0.2) * 2 * math.pi) * 8;
      canvas.drawCircle(
        Offset((size.width / 4) * (i + 1), size.height / 2 + y),
        5,
        Paint()..color = c,
      );
    }
  }
}

/// Draws a circular shimmer effect using a rotating SweepGradient.
class _ShimmerPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _ShimmerPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..strokeCap = StrokeCap.round;
    p.shader = SweepGradient(
      colors: [c.withValues(alpha: 0.1), c, c.withValues(alpha: 0.1)],
      stops: [0.0, v, 1.0],
    ).createShader(Offset.zero & size);
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, p);
  }
}
