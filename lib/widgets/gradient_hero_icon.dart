import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A circular gradient-filled icon used at the top of each screen (lock for
/// Login, person for Sign-Up, check for Home) so all three share the same
/// "hero" visual treatment.
class GradientHeroIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const GradientHeroIcon({
    super.key,
    required this.icon,
    this.size = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.44),
    );
  }
}
