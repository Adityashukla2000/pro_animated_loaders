# 🚀 Pro Animated Loaders

A professional suite of high-performance, beautiful, and modern loading animations for Flutter. 
Designed to deliver a premium UI experience with zero extra dependencies and minimal effort.

---

## ✨ Features

* 🎨 **10+ Unique Styles**: Pulse, Glowing Arc, Bouncing Dots, Ripple, and more.
* ⚡ **Performance Optimized**: Uses `RepaintBoundary` and `CustomPainter` for smooth 60fps.
* 🧩 **Theme Aware**: Automatically inherits your app's `primaryColor` by default.
* 📱 **Responsive & Production-Ready**: Scales perfectly across Mobile, Web, and Desktop.
* 🌗 **Dark Mode Support**: Works seamlessly with dark and light themes.
* 🚀 **Smart Text Rendering**: Only shows label text if a message is provided.
* 🔥 **Zero Dependencies**: Built purely with Flutter SDK.

---

## 📦 Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  pro_animated_loaders: ^1.0.0


Then run: flutter pub get

🛠 Usage
🔹 1. Import Package

import 'package:pro_animated_loaders/pro_animated_loaders.dart';


🔹 2. Simple Usage (Recommended)
One-line implementation that follows your app's theme automatically.

const ProAnimatedLoader(
  type: LoaderType.glowingArc,
)

🔹 3. Fully Customized
Control size, color, speed, and messaging with ease.

const ProAnimatedLoader(
  type: LoaderType.jumpingDots,
  color: Colors.indigoAccent,
  size: 60.0,
  message: "Syncing Data...",
  duration: Duration(milliseconds: 1200),
)

🔹 4. Available Loader Types
Choose from a wide variety of professional styles:

// ✅ Available Types:
LoaderType.pulse;        // Rippling circle effect
LoaderType.dots;         // Google style bouncing dots
LoaderType.spinningRing; // Modern classic ring
LoaderType.hourGlass;    // Rotating hourglass shape
LoaderType.shimmer;      // Soft iOS-style glowing ring
LoaderType.dualRing;     // Two rings rotating in opposite directions
LoaderType.chasingDots;  // Orbital dots animation
LoaderType.ripple;       // Multiple concentric ripples
LoaderType.jumpingDots;  // Horizontal bouncing dots

🧱 Architecture
This package follows a clean, modular, and performant structure:

ProAnimatedLoader → Main widget that handles animation lifecycle and performance.

LoaderType → Enum-based selection for developer-friendly API.

LoaderPainterFactory → Internal engine mapping types to specific CustomPainters.

BaseLoaderPainter → Optimized abstract class for all geometry drawing logic.

RepaintBoundary → Isolates the animation layer to prevent unnecessary global UI repaints.

🤝 Contributing
Contributions make the Flutter community amazing!
If you'd like to improve this package:

1. Fork the repository.

2. Create a new branch (feature/AmazingLoader).

3. Commit your changes.

4. Submit a pull request.


🐛 Issues & Feedback
If you find any bugs or have suggestions for new loader types, feel free to open an issue on GitHub.

📄 License
This project is licensed under the MIT License.

