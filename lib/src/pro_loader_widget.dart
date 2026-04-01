import 'package:flutter/material.dart';
import 'loader_types.dart';
import 'loader_painter.dart';

/// **ProAnimatedLoader** is a highly customizable and performance-optimized
/// loading widget.
///
/// It uses [CustomPaint] combined with [RepaintBoundary] to ensure smooth
/// 60fps animations without triggering unnecessary repaints of the parent widgets.
///
/// Example usage:
/// ```dart
/// ProAnimatedLoader(
///   type: LoaderType.glowingArc,
///   color: Colors.blue,
///   message: "Loading...",
/// )
/// ```
class ProAnimatedLoader extends StatefulWidget {
  /// The style of animation to be displayed.
  final LoaderType type;

  /// The primary color of the loader.
  /// If null, it defaults to [Theme.of(context).colorScheme.primary].
  final Color? color;

  /// The diameter/size of the loader. Defaults to 50.0.
  final double size;

  /// An optional text message displayed below the loader.
  final String? message;

  /// The thickness of the lines for ring-based animations. Defaults to 3.0.
  final double strokeWidth;

  /// The time taken to complete one full animation cycle. Defaults to 1500ms.
  final Duration duration;

  const ProAnimatedLoader({
    super.key,
    required this.type,
    this.color,
    this.size = 50.0,
    this.message,
    this.strokeWidth = 3.0,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ProAnimatedLoader> createState() => _ProAnimatedLoaderState();
}

class _ProAnimatedLoaderState extends State<ProAnimatedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the color based on user input or theme defaults.
    final effectiveColor =
        widget.color ?? Theme.of(context).colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// [RepaintBoundary] isolates the animation paint calls.
        /// This prevents the entire screen from repainting during every
        /// animation tick, significantly improving performance.
        RepaintBoundary(
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => CustomPaint(
                painter: LoaderPainterFactory.getPainter(
                  widget.type,
                  _controller.value,
                  effectiveColor,
                  widget.strokeWidth,
                ),
              ),
            ),
          ),
        ),

        /// Smart Message Rendering: Only shows if the message is provided and not empty.
        if (widget.message != null && widget.message!.isNotEmpty) ...[
          SizedBox(height: widget.size * 0.2), // Dynamic spacing based on size.
          Text(
            widget.message!,
            textAlign: TextAlign.center,
            style: TextStyle(
              /// Font size scales with loader size, clamped between 12 and 16.
              fontSize: (widget.size * 0.3).clamp(12, 16),
              fontWeight: FontWeight.w500,

              /// Using Flutter 3.22+ withValues for modern opacity handling.
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
            ),
          ),
        ],
      ],
    );
  }
}
