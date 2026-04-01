

## 1.0.3
> Massive Animation Expansion 🎨
> Added 20+ new premium loader types, bringing the total to 30 unique animations.

* New Additions: waveDots, inkDrop, twistingDots, threeRotatingDots, staggeredDotsWave, fourRotatingDots, fallingDot, progressiveDots, discreteCircular, threeArchedCircle, bouncingBall, flickr, hexagonDots, beat, twoRotatingArc, horizontalRotatingDots, newtonCradle, stretchedDots, halfTriangleDot, and dotsTriangle.

* Rendering Engine Upgrades ⚡
Modern Opacity Handling: Migrated all painters to use withValues(alpha: ...), fully optimized for Flutter’s Impeller rendering engine.

* Advanced Pathing: Improved path-based animations (like halfTriangleDot) using PathMetric for mathematically precise, smooth orbital movements.

* Developer Experience (DX) 🛠️
* Interactive Example App: Updated the Official Example with a "Tap to Copy" feature and a modern responsive grid for rapid    prototyping.

* Performance Refinement: Optimized _BasePainter logic to ensure zero unnecessary repaints outside the active animation loop.

* UI Polish: Improved beautifyName logic in the demo app for better presentation of enum types.

## 1.0.2

* 📖 Updated documentation and README with preview support.

## 1.0.1

* 🐛 Minor bug fixes and performance improvements.
* 🎨 Improved animation smoothness across all loader types.
* 📱 Enhanced responsiveness for different screen sizes.
* 🧹 Code cleanup and internal optimizations.
* 📖 Updated documentation and README with preview support.

---

## 1.0.0

* **Initial Release** 🚀
* Added `ProAnimatedLoader` widget with 10+ high-performance animation styles.
* Supported `LoaderType` enum for easy animation selection:
    * `pulse`, `spinningRing`, `glowingArc`, `dots`, `dualRing`, etc.
* Implemented **Smart Theme Integration**: Automatically uses `Theme.of(context).primaryColor`.
* Optimized rendering using `RepaintBoundary` and `CustomPainter` for 60 FPS performance.
* Added support for custom sizes, colors, stroke widths, and optional loading messages.
* Fully Null-Safe and production-ready.