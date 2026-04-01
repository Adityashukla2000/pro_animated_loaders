/// Defines the available animation styles for the [ProAnimatedLoader].
///
/// Each type represents a unique [CustomPainter] implementation
/// handled by the [LoaderPainterFactory].
enum LoaderType {
  /// A single circle that grows in size while fading out.
  /// Best for: Subtle background loading.
  pulse,

  /// A classic rotating ring with rounded edges.
  /// Best for: Standard indeterminate loading.
  spinningRing,

  /// An arc with a glowing gradient trail that rotates 360 degrees.
  /// Best for: Modern and premium UI feel.
  glowingArc,

  /// Three horizontal dots that scale up and down in a wave pattern.
  /// Best for: Messaging or small surface areas.
  dots,

  /// Two concentric rings rotating in opposite directions.
  /// Best for: High-tech or complex data processing visuals.
  dualRing,

  /// Multiple small dots chasing each other in a circular orbit.
  /// Best for: Modern web-style loading.
  chasingDots,

  /// A rotating hourglass shape created using vector paths.
  /// Best for: Time-bound or legacy wait states.
  hourGlass,

  /// Multiple concentric rings that ripple outwards like water.
  /// Best for: Searching or broadcasting states.
  ripple,

  /// Three horizontal dots that physically jump up and down.
  /// Best for: Playful or informal UI designs.
  jumpingDots,

  /// A smooth, rotating sweep gradient that creates a shimmering light effect.
  /// Best for: Skeleton-loading alternatives or soft UI.
  shimmer,
}
