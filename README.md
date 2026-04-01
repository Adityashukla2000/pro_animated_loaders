# 🚀 Pro Animated Loaders

A **professional suite of high-performance, modular, and beautiful loading animations for Flutter**.
Built for developers who want **smooth, elegant loading states** without relying on heavy Lottie files or external dependencies.

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
  pro_animated_loaders: ^1.0.2
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

| Loader Name   | Enum Value               |
| ------------- | ------------------------ |
| Glowing Arc   | `LoaderType.glowingArc`  |
| Bouncing Dots | `LoaderType.jumpingDots` |
| Pulse Ripple  | `LoaderType.pulse`       |
| Dual Ring     | `LoaderType.dualRing`    |
| Hour Glass    | `LoaderType.hourGlass`   |
| Shimmer       | `LoaderType.shimmer`     |

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
