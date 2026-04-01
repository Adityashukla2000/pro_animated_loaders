/// **Pro Animated Loaders - Official Example**
///
/// This example application demonstrates the full suite of animations
/// available in the [pro_animated_loaders] package.
///
/// Key Features Demonstrated:
/// * Adaptive Theming (Light/Dark mode support)
/// * Modern Grid Layout using Slivers
/// * Interactive 'Tap to Copy' functionality for developers
/// * proportional scaling and color inheritance
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_animated_loaders/pro_animated_loaders.dart';

void main() {
  runApp(const ProLoaderExample());
}

/// Root widget of the example app.
/// It configures the global theme using [colorSchemeSeed] for a modern look.
class ProLoaderExample extends StatelessWidget {
  const ProLoaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Animated Loaders Demo',
      debugShowCheckedModeBanner: false,

      // Light Theme Configuration
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6366F1),
        brightness: Brightness.light,
      ),

      // Dark Theme Configuration - Premium Look
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6366F1),
        brightness: Brightness.dark,
      ),

      home: const ShowcaseScreen(),
    );
  }
}

/// The primary gallery screen showcasing all available [LoaderType]s.
class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pro Animated Loaders"),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'About Package',
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Header Section: Introductory text and branding
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 24.0,
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    size: 48,
                    color: Color(0xFF6366F1),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Premium Animations",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "High-performance CustomPainter loaders for modern Flutter apps.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),

          // Loader Grid: Dynamically generates cards for every LoaderType enum value
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final type = LoaderType.values[index];
                final color = _getModernColor(index);
                return _LoaderCard(type: type, color: color);
              }, childCount: LoaderType.values.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  /// Returns a curated palette of modern colors for visual variety in the catalog.
  Color _getModernColor(int index) {
    const modernColors = [
      Color(0xFF6366F1), // Indigo
      Color(0xFFEC4899), // Pink
      Color(0xFF8B5CF6), // Violet
      Color(0xFF10B981), // Emerald
      Color(0xFFF59E0B), // Amber
      Color(0xFF3B82F6), // Blue
      Color(0xFFEF4444), // Red
      Color(0xFF06B6D4), // Cyan
    ];
    return modernColors[index % modernColors.length];
  }

  /// Displays information about the package design and performance.
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "Pro Animated Loaders",
      applicationVersion: "1.0.0",
      applicationIcon: const Icon(Icons.bolt, color: Colors.amber),
      children: [
        const Text(
          "This package provides smooth, vector-based loading animations "
          "without the weight of Lottie or GIFs. Every loader is built using "
          "CustomPainter for maximum performance.",
        ),
      ],
    );
  }
}

/// A card widget that displays an individual loader and its technical name.
/// Includes a 'Tap to Copy' feature for better developer experience.
class _LoaderCard extends StatelessWidget {
  final LoaderType type;
  final Color color;

  const _LoaderCard({required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        // Feature: Easily copy the enum value to clipboard for quick implementation
        Clipboard.setData(ClipboardData(text: 'LoaderType.${type.name}'));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Copied LoaderType.${type.name}"),
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(24),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: isDark
                ? Colors.white10
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Loader Display Area
              Expanded(
                child: Center(
                  child: ProAnimatedLoader(
                    type: type,
                    size: 50,
                    color: color,
                    strokeWidth: 4,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Formatted Label (e.g., "glowingArc" -> "Glowing Arc")
              Text(
                _beautifyName(type.name),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),

              // Technical Tag: Displays the exact enum value used in code
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "type: ${type.name}",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'monospace',
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Converts camelCase enum names into readable Title Case labels.
  String _beautifyName(String name) {
    final result = name.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(0)}',
    );
    return result[0].toUpperCase() + result.substring(1);
  }
}
