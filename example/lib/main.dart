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
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Note: Ensure your local file structure matches this import
import 'package:pro_animated_loaders/pro_animated_loaders.dart';

void main() {
  // Sets the status bar to transparent for a truly immersive "Pro" feel
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ProLoaderExample());
}

class ProLoaderExample extends StatelessWidget {
  const ProLoaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Animated Loaders Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      // Light Theme: Clean and Modern
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6366F1),
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),

      // Dark Theme: Premium Deep Slate
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF818CF8),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),

      home: const ShowcaseScreen(),
    );
  }
}

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing all enum values automatically includes the 20+ new loaders added
    final allLoaders = LoaderType.values;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Custom App Bar with Silver Effects
          SliverAppBar.large(
            title: const Text(
              "Pro Loaders",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.help_outline_rounded),
                onPressed: () => _showDocsSnack(context),
              ),
            ],
          ),

          // Statistics Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "${allLoaders.length} ANIMATIONS LOADED",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Vector-based. High Performance. 60 FPS.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(
                        context,
                      ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // The Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final type = allLoaders[index];
                return _LoaderCard(
                  type: type,
                  color: _getPaletteColor(index, context),
                );
              }, childCount: allLoaders.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }

  /// Cycles through a professional palette based on the current theme
  Color _getPaletteColor(int index, BuildContext context) {
    final colors = [
      const Color(0xFF6366F1), // Indigo
      const Color(0xFF06B6D4), // Cyan
      const Color(0xFF10B981), // Emerald
      const Color(0xFFF59E0B), // Amber
      const Color(0xFFEC4899), // Pink
      const Color(0xFF8B5CF6), // Violet
      const Color(0xFFF43F5E), // Rose
    ];
    return colors[index % colors.length];
  }

  void _showDocsSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Built with Flutter CustomPainter Engine")),
    );
  }
}

class _LoaderCard extends StatelessWidget {
  final LoaderType type;
  final Color color;

  const _LoaderCard({required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: 'LoaderType.${type.name}'));
        HapticFeedback.lightImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Copied: LoaderType.${type.name}"),
            behavior: SnackBarBehavior.floating,
            width: 250,
            duration: const Duration(milliseconds: 1500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withValues(alpha: 0.03) : Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isDark
                ? Colors.white10
                : Colors.black.withValues(alpha: 0.05),
            width: 1,
          ),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ProAnimatedLoader(
                  type: type,
                  size: 45,
                  color: color,
                  strokeWidth: 3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 8, right: 8),
              child: Column(
                children: [
                  Text(
                    _formatName(type.name),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "TAP TO COPY",
                    style: TextStyle(
                      fontSize: 9,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w900,
                      color: color.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatName(String camelCase) {
    final words = camelCase.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(0)}',
    );
    return words[0].toUpperCase() + words.substring(1);
  }
}
