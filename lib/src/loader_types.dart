/// Defines the available animation styles for the [ProAnimatedLoader].
///
/// Each type represents a unique [CustomPainter] implementation
/// handled by the [LoaderPainterFactory].
enum LoaderType {
  // --- CLASSIC LOADERS ---

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

  // --- DOTS & WAVE VARIATIONS (v1.0.3) ---

  /// Five dots creating a fluid, continuous sine wave.
  waveDots,

  /// Multiple dots with individual phase delays creating a staggered wave.
  staggeredDotsWave,

  /// Three dots that rotate while simultaneously moving inward and outward.
  twistingDots,

  /// Horizontal dots that stretch vertically as they move.
  stretchedDots,

  /// Horizontal dots that move from left to right with fading edges.
  horizontalRotatingDots,

  // --- CIRCULAR & ORBITAL (v1.0.3) ---

  /// Three dots orbiting a central point at 120-degree intervals.
  threeRotatingDots,

  /// Four dots orbiting a central point in a square formation.
  fourRotatingDots,

  /// A circle of discrete dots that light up sequentially.
  discreteCircular,

  /// Three concentric broken arcs rotating at independent speeds.
  threeArchedCircle,

  /// Two arcs of different lengths rotating in opposite directions.
  twoRotatingArc,

  // --- PHYSICS & GEOMETRIC (v1.0.3) ---

  /// A central circle that expands while a smaller inner core shrinks.
  inkDrop,

  /// A single dot that falls from the top and splashes at the bottom.
  fallingDot,

  /// Dots that appear one by one to form a complete line.
  progressiveDots,

  /// A ball that bounces vertically with a squash-and-stretch effect.
  bouncingBall,

  /// Two dots that swap horizontal positions with a scaling "pop."
  flickr,

  /// Six dots arranged in a hexagon that pulse in size.
  hexagonDots,

  /// A single circle that scales with a double-beat heartbeat rhythm.
  beat,

  /// A 5-dot physics simulation where the end dots kick out.
  newtonCradle,

  /// A single dot traveling along the invisible perimeter of a triangle.
  halfTriangleDot,

  /// Three dots forming a triangle that rotates around its centroid.
  dotsTriangle,
}
