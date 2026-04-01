# 🚀 Pro Animated Loaders

A professional suite of **30+ high-performance, modular, and beautiful loading animations** for Flutter.

Built for developers who want **smooth, elegant loading states** without the overhead of Lottie files or GIFs.

---

## ✨ What's New in v1.0.3?

- 🎨 **30+ Unique Styles**  
  Tripled the library size with 20+ new premium animations.

- ⚡ **Impeller Optimized**  
  Fully migrated to `withValues(alpha: ...)` for the next-gen Flutter rendering engine.

---

## ✨ Features

* 🎯 **10+ Unique Styles**
  Includes pulse ripples, glowing arcs, bouncing dots, dual rings, shimmer loaders, and more.

* 🎨 **Theme Aware**
  Automatically adapts to your app’s `ColorScheme.primary` if no color is provided.

* ⚡ **Performance Optimized**
  Built using `RepaintBoundary` and `CustomPainter` to ensure **smooth 60 FPS animations** with minimal rebuilds.

* 🧠 **Smart Layout**
  Message text is conditionally rendered — **no extra space** when not used.

* 🔧 **Fully Customizable**
  Control size, colors, stroke width, animation duration, and more.

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  pro_animated_loaders: ^1.0.3
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Quick Start

### 1. Minimal Usage

Automatically inherits your app theme:

```dart
import 'package:pro_animated_loaders/pro_animated_loaders.dart';

const ProAnimatedLoader(
  type: LoaderType.glowingArc,
)
```

---

### 2. Custom Styling

Full control over appearance:

```dart
const ProAnimatedLoader(
  type: LoaderType.jumpingDots,
  color: Colors.indigoAccent,
  size: 60.0,
  message: "Syncing Data...",
  duration: Duration(milliseconds: 1200),
)
```

---

## 🎨 Loader Types

The package now supports **30+ unique animations**, categorized by their visual motion:

---

### 🌟 Featured & Classic

| Loader Name     | Enum Value              | Description                          |
|----------------|------------------------|--------------------------------------|
| Glowing Arc    | `LoaderType.glowingArc` | Modern gradient rotating arc         |
| Pulse Ripple   | `LoaderType.pulse`      | Concentric fading rings              |
| Dual Ring      | `LoaderType.dualRing`   | Two rings rotating in opposition     |
| Shimmer        | `LoaderType.shimmer`    | Smooth sweep gradient effect         |
| Hour Glass     | `LoaderType.hourGlass`  | Rotating vector path hourglass       |

---

### 🟢 Dots & Waves

| Loader Name        | Enum Value                         |
|-------------------|-----------------------------------|
| Jumping Dots      | `LoaderType.jumpingDots`           |
| Wave Dots         | `LoaderType.waveDots`              |
| Staggered Wave    | `LoaderType.staggeredDotsWave`     |
| Twisting Dots     | `LoaderType.twistingDots`          |
| Stretched Dots    | `LoaderType.stretchedDots`         |

---

### 🚀 Physics & Advanced Motion

| Loader Name      | Enum Value                   |
|-----------------|-----------------------------|
| Newton Cradle   | `LoaderType.newtonCradle`   |
| Bouncing Ball   | `LoaderType.bouncingBall`   |
| Ink Drop        | `LoaderType.inkDrop`        |
| Falling Dot     | `LoaderType.fallingDot`     |
| Flickr Swapper  | `LoaderType.flickr`         |
| Heartbeat       | `LoaderType.beat`           |

---

### 🔄 Circular & Geometric

| Loader Name        | Enum Value                         |
|-------------------|-----------------------------------|
| Chasing Dots      | `LoaderType.chasingDots`           |
| 3 Rotating Dots   | `LoaderType.threeRotatingDots`     |
| Discrete Circle   | `LoaderType.discreteCircular`      |
| Arched Circle     | `LoaderType.threeArchedCircle`     |
| Hexagon Dots      | `LoaderType.hexagonDots`           |
| Dots Triangle     | `LoaderType.dotsTriangle`          |

---

## 🛠️ Properties

| Property      | Type       | Default       | Description                |
| ------------- | ---------- | ------------- | -------------------------- |
| `type`        | LoaderType | **Required**  | Animation style            |
| `color`       | Color?     | Theme Primary | Loader color               |
| `size`        | double     | 50.0          | Width & height             |
| `message`     | String?    | null          | Optional text below loader |
| `strokeWidth` | double     | 4.0           | Thickness for ring loaders |
| `duration`    | Duration   | 1500ms        | Animation speed            |

---


## 📱 App Preview
<p align="center">
  <img src="https://raw.githubusercontent.com/Adityashukla2000/pro_animated_loaders/main/assets/images/loader1.jpeg" width="250"/>
  <img src="https://raw.githubusercontent.com/Adityashukla2000/pro_animated_loaders/main/assets/images/loader2.jpeg" width="250"/>
</p>




## 💡 Best Practices

### 🔹 Use in Dialogs (Loading Overlay)

Create a clean and professional loading experience:

```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => const Center(
    child: ProAnimatedLoader(
      type: LoaderType.shimmer,
      message: "Processing Payment...",
    ),
  ),
);
```

---

### 🔹 Use with State Management

Perfect for:

* API calls
* Firebase operations
* Payment processing
* File uploads

---

## ⚡ Performance Notes

* Uses **CustomPainter** for efficient rendering
* Wrapped in **RepaintBoundary** to prevent unnecessary redraws
* No third-party heavy animation dependencies

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License**.
See the `LICENSE` file for details.

---

## ⭐ Support

If you like this package:

* ⭐ Star the repo
* 🐛 Report issues
* 💡 Suggest new loader ideas

---

Built with ❤️ for Flutter developers who care about performance and design.
