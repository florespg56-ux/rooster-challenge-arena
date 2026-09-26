import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const RoosterChallengeArena());
}

class RoosterChallengeArena extends StatelessWidget {
  const RoosterChallengeArena({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rooster Challenge Arena',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
