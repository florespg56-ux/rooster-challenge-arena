import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Wraps a screen's content in the app's shared dark gradient background,
/// plus a couple of soft blurred glow accents for visual depth. Used by
/// Login, Sign-Up, and Home so all three feel like one cohesive app.
class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.backgroundGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Soft glow accent, top-right.
          Positioned(
            top: -80,
            right: -60,
            child: _Glow(color: AppColors.primary.withOpacity(0.25)),
          ),
          // Soft glow accent, bottom-left.
          Positioned(
            bottom: -100,
            left: -70,
            child: _Glow(color: AppColors.primary.withOpacity(0.15)),
          ),
          child,
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  const _Glow({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
        ),
      ),
    );
  }
}
