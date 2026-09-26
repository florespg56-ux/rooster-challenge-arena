import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/auth_background.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleLogout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  Widget _statCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget matchCard(
    BuildContext context,
    String rooster1,
    String rooster2,
    String schedule,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(.75),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.3),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "$rooster1 VS $rooster2",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            schedule,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Selected $rooster1",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.sports),
                  label: Text(rooster1),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Selected $rooster2",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.sports),
                  label: Text(rooster2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final String displayName =
        (args is HomeScreenArgs && args.name.isNotEmpty)
            ? args.name
            : 'Guest';

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text("Rooster Challenge Arena"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),

      body: AuthBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                // HERO CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emoji_events,
                        size: 80,
                        color: Colors.amber,
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "Welcome, $displayName!",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Challenge Arena Tournament Dashboard",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // STATISTICS
                Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        'Matches',
                        '4',
                        Icons.gavel,
                        Colors.blue,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: _statCard(
                        'Players',
                        '8',
                        Icons.groups,
                        Colors.green,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: _statCard(
                        'Round',
                        'QF',
                        Icons.emoji_events,
                        Colors.orange,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "Upcoming Matches",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                matchCard(
                  context,
                  "Pico Pico",
                  "Lulu",
                  "2:00 PM",
                  const Color.fromARGB(255, 48, 33, 32),
                ),

                matchCard(
                  context,
                  "Tralalels",
                  "Cocoroco",
                  "3:00 PM",
                  const Color.fromARGB(255, 53, 63, 71),
                ),

                matchCard(
                  context,
                  "Master Beat",
                  "Fringles",
                  "4:00 PM",
                  const Color.fromARGB(255, 61, 46, 24),
                ),

                matchCard(
                  context,
                  "Tung Naur",
                  "Ting Aling",
                  "5:00 PM",
                  const Color.fromARGB(255, 18, 49, 19),
                ),

                const SizedBox(height: 25),

                // TOURNAMENT INFO
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Tournament Information",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 15),

                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text("Total Participants"),
                        trailing: Text("8"),
                      ),

                      ListTile(
                        leading: Icon(Icons.emoji_events),
                        title: Text("Current Round"),
                        trailing: Text("Quarter Finals"),
                      ),

                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Venue"),
                        trailing: Text("Hagunoy walay kanin busing"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                PrimaryButton(
                  label: "Logout",
                  icon: Icons.logout,
                  onPressed: () => _handleLogout(context),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}