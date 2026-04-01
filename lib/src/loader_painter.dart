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

      case LoaderType.waveDots:
        return _WaveDotsPainter(value, color);
      case LoaderType.inkDrop:
        return _InkDropPainter(value, color);
      case LoaderType.twistingDots:
        return _TwistingDotsPainter(value, color);
      case LoaderType.threeRotatingDots:
        return _ThreeRotatingDotsPainter(value, color);
      case LoaderType.staggeredDotsWave:
        return _StaggeredWavePainter(value, color);
      case LoaderType.fourRotatingDots:
        return _FourRotatingDotsPainter(value, color);
      case LoaderType.fallingDot:
        return _FallingDotPainter(value, color);
      case LoaderType.progressiveDots:
        return _ProgressiveDotsPainter(value, color);
      case LoaderType.discreteCircular:
        return _DiscreteCircularPainter(value, color, sw);
      case LoaderType.threeArchedCircle:
        return _ThreeArchedPainter(value, color, sw);
      case LoaderType.bouncingBall:
        return _BouncingBallPainter(value, color);
      case LoaderType.flickr:
        return _FlickrPainter(value, color);
      case LoaderType.hexagonDots:
        return _HexagonDotsPainter(value, color);
      case LoaderType.beat:
        return _BeatPainter(value, color);
      case LoaderType.twoRotatingArc:
        return _TwoRotatingArcPainter(value, color, sw);
      case LoaderType.horizontalRotatingDots:
        return _HorizontalRotatingPainter(value, color);
      case LoaderType.newtonCradle:
        return _NewtonCradlePainter(value, color);
      case LoaderType.stretchedDots:
        return _StretchedDotsPainter(value, color);
      case LoaderType.halfTriangleDot:
        return _HalfTrianglePainter(value, color);
      case LoaderType.dotsTriangle:
        return _DotsTrianglePainter(value, color);
      default:
        return _PulsePainter(value, color);
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

/// Two dots swapping places horizontally with a "pop" scale.
class _FlickrPainter extends _BasePainter {
  final double v;
  final Color c;
  _FlickrPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final dist = (size.width / 3) * math.cos(v * 2 * math.pi);
    canvas.drawCircle(
      center + Offset(dist, 0),
      6 * (1 + 0.2 * math.sin(v * 2 * math.pi)),
      Paint()..color = c,
    );
    canvas.drawCircle(
      center - Offset(dist, 0),
      6 * (1 - 0.2 * math.sin(v * 2 * math.pi)),
      Paint()..color = c.withValues(alpha: 0.5),
    );
  }
}

/// Five dots creating a fluid wave.
class _WaveDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _WaveDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 5; i++) {
      double y = math.sin((v * 2 * math.pi) - (i * 0.8)) * (size.height / 4);
      canvas.drawCircle(
        Offset((size.width / 6) * (i + 1), size.height / 2 + y),
        size.width / 15,
        Paint()..color = c,
      );
    }
  }
}

/// A "Newtons Cradle" effect where end dots kick out.
class _NewtonCradlePainter extends _BasePainter {
  final double v;
  final Color c;
  _NewtonCradlePainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final count = 5;
    final spacing = size.width / (count + 1);
    for (int i = 0; i < count; i++) {
      double offset = 0;
      if (i == 0 && v < 0.5) offset = -math.sin(v * 2 * math.pi) * 10;
      if (i == count - 1 && v > 0.5) {
        offset = math.sin((v - 0.5) * 2 * math.pi) * 10;
      }
      canvas.drawCircle(
        Offset(spacing * (i + 1) + offset, size.height / 2),
        4,
        Paint()..color = c,
      );
    }
  }
}

/// Three arcs forming a broken circle rotating at different speeds.
class _ThreeArchedPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _ThreeArchedPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = c
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..strokeCap = StrokeCap.round;
    for (int i = 1; i <= 3; i++) {
      double radius = (size.width / 2) / (i * 0.5 + 0.5);
      canvas.drawArc(
        Rect.fromCenter(
          center: size.center(Offset.zero),
          width: radius,
          height: radius,
        ),
        v * 2 * math.pi * i,
        1.5,
        false,
        p,
      );
    }
  }
}

/// Dots forming a triangle that rotates.
class _DotsTrianglePainter extends _BasePainter {
  final double v;
  final Color c;
  _DotsTrianglePainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 3;
    for (int i = 0; i < 3; i++) {
      double angle = (v * 2 * math.pi) + (i * 2 * math.pi / 3);
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * radius,
          center.dy + math.sin(angle) * radius,
        ),
        5,
        Paint()..color = c,
      );
    }
  }
}

/// A "heartbeat" scaling effect.
class _BeatPainter extends _BasePainter {
  final double v;
  final Color c;
  _BeatPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    double scale = 1.0;
    if (v < 0.2) {
      scale = 1.0 + (v * 2);
    } else if (v < 0.4) {
      scale = 1.4 - ((v - 0.2) * 2);
      canvas.drawCircle(
        size.center(Offset.zero),
        (size.width / 3) * scale,
        Paint()..color = c,
      );
    }
  }
}

/// Dots rotating around a center, twisting inward and outward.
class _TwistingDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _TwistingDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (int i = 0; i < 6; i++) {
      double angle = (v * 2 * math.pi) + (i * math.pi / 3);
      double dist = (size.width / 3) * (0.5 + 0.5 * math.sin(v * 2 * math.pi));
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * dist,
          center.dy + math.sin(angle) * dist,
        ),
        4,
        Paint()..color = c,
      );
    }
  }
}

/// A central circle that drops in size and "bleeds" out like ink.
class _InkDropPainter extends _BasePainter {
  final double v;
  final Color c;
  _InkDropPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    double radius = (size.width / 2) * v;
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = c.withValues(alpha: 1 - v),
    );
    canvas.drawCircle(center, (size.width / 4) * (1 - v), Paint()..color = c);
  }
}

/// Three dots orbiting a center point.
class _ThreeRotatingDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _ThreeRotatingDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (int i = 0; i < 3; i++) {
      double angle = (v * 2 * math.pi) + (i * 2 * math.pi / 3);
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * (size.width / 3),
          center.dy + math.sin(angle) * (size.width / 3),
        ),
        size.width / 12,
        Paint()..color = c,
      );
    }
  }
}

/// A complex wave where dots are staggered by phase.
class _StaggeredWavePainter extends _BasePainter {
  final double v;
  final Color c;
  _StaggeredWavePainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 6; i++) {
      double delay = i * 0.15;
      double y = math.sin((v * 2 * math.pi) - delay) * (size.height / 3);
      canvas.drawCircle(
        Offset((size.width / 7) * (i + 1), size.height / 2 + y),
        3,
        Paint()..color = c.withValues(alpha: 1 - (i * 0.1)),
      );
    }
  }
}

/// Four dots rotating in a square formation.
class _FourRotatingDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _FourRotatingDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (int i = 0; i < 4; i++) {
      double angle = (v * 2 * math.pi) + (i * math.pi / 2);
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * (size.width / 3),
          center.dy + math.sin(angle) * (size.width / 3),
        ),
        5,
        Paint()..color = c,
      );
    }
  }
}

/// A dot that falls from the top and "splashes" at the bottom.
class _FallingDotPainter extends _BasePainter {
  final double v;
  final Color c;
  _FallingDotPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    double y = size.height * v;
    double radius = (v > 0.8) ? 5 + (v - 0.8) * 20 : 5;
    double opacity = (v > 0.8) ? 1 - (v - 0.8) * 5 : 1.0;
    canvas.drawCircle(
      Offset(size.width / 2, y),
      radius,
      Paint()..color = c.withValues(alpha: opacity.clamp(0, 1)),
    );
  }
}

/// Dots that appear one by one in a line.
class _ProgressiveDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _ProgressiveDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 4; i++) {
      double threshold = i / 4;
      double opacity = v > threshold ? 1.0 : 0.2;
      canvas.drawCircle(
        Offset((size.width / 5) * (i + 1), size.height / 2),
        4,
        Paint()..color = c.withValues(alpha: opacity),
      );
    }
  }
}

/// A circle made of discrete dots that light up sequentially.
class _DiscreteCircularPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _DiscreteCircularPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final count = 8;
    for (int i = 0; i < count; i++) {
      double angle = (i * 2 * math.pi) / count;
      double active = ((v * count).floor() == i) ? 1.0 : 0.3;
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * (size.width / 2.5),
          center.dy + math.sin(angle) * (size.width / 2.5),
        ),
        sw,
        Paint()..color = c.withValues(alpha: active),
      );
    }
  }
}

/// A ball that bounces and squashes on impact.
class _BouncingBallPainter extends _BasePainter {
  final double v;
  final Color c;
  _BouncingBallPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    double y =
        (math.sin(v * math.pi).abs() * -(size.height - 10)) + size.height - 5;
    double stretch = 1.0 + (math.cos(v * math.pi).abs() * 0.3);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, y),
        width: 10 / stretch,
        height: 10 * stretch,
      ),
      Paint()..color = c,
    );
  }
}

/// Dots arranged in a hexagon that pulse.
class _HexagonDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _HexagonDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (int i = 0; i < 6; i++) {
      double angle = i * math.pi / 3;
      double pulse = 1.0 + 0.3 * math.sin((v * 2 * math.pi) + i);
      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * (size.width / 3),
          center.dy + math.sin(angle) * (size.width / 3),
        ),
        4 * pulse,
        Paint()..color = c,
      );
    }
  }
}

/// Two arcs rotating at different speeds to create a dynamic ring.
class _TwoRotatingArcPainter extends _BasePainter {
  final double v;
  final Color c;
  final double sw;
  _TwoRotatingArcPainter(this.v, this.c, this.sw);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = c
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Offset.zero & size,
      v * 2 * math.pi,
      math.pi * 0.8,
      false,
      p,
    );
    canvas.drawArc(
      Offset.zero & size,
      -v * 4 * math.pi,
      math.pi * 0.4,
      false,
      p,
    );
  }
}

/// Horizontal line of dots that move from left to right.
class _HorizontalRotatingPainter extends _BasePainter {
  final double v;
  final Color c;
  _HorizontalRotatingPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 3; i++) {
      double x = ((v + i * 0.33) % 1.0) * size.width;
      canvas.drawCircle(
        Offset(x, size.height / 2),
        4,
        Paint()
          ..color = c.withValues(alpha: math.sin(x / size.width * math.pi)),
      );
    }
  }
}

/// Dots that stretch into ellipses as they move.
class _StretchedDotsPainter extends _BasePainter {
  final double v;
  final Color c;
  _StretchedDotsPainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 3; i++) {
      double x = (size.width / 4) * (i + 1);
      double stretch = 1 + math.sin((v + i * 0.3) * 2 * math.pi).abs() * 2;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(x, size.height / 2),
          width: 6,
          height: 6 * stretch,
        ),
        Paint()..color = c,
      );
    }
  }
}

/// A dot moving along a triangular path.
class _HalfTrianglePainter extends _BasePainter {
  final double v;
  final Color c;
  _HalfTrianglePainter(this.v, this.c);
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final metrics = path.computeMetrics().first;
    final pos = metrics.getTangentForOffset(metrics.length * v)!.position;

    canvas.drawPath(
      path,
      Paint()
        ..color = c.withValues(alpha: 0.1)
        ..style = PaintingStyle.stroke,
    );
    canvas.drawCircle(pos, 5, Paint()..color = c);
  }
}
