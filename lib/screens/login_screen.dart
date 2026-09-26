import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
      arguments: HomeScreenArgs(
        name: _emailController.text.trim(),
      ),
    );
  }

  void _goToSignUp() {
    Navigator.pushNamed(
      context,
      AppRoutes.signup,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // LEFT SIDE BANNER
          Expanded(
            flex: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/sabong_banner.jpg',
                  fit: BoxFit.cover,
                ),

                Container(
                  color: Colors.black.withOpacity(0.45),
                ),

                const Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.emoji_events,
                        color: Colors.amber,
                        size: 70,
                      ),

                      SizedBox(height: 20),

                      Text(
                        'ROOSTER\nCHALLENGE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        'Pumusta at manalo na\nMga manok sa sabong arena!',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // RIGHT SIDE LOGIN FORM
          Expanded(
            flex: 4,
            child: Container(
              color: const Color(0xFF0F172A),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(40),
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Icon(
                            Icons.sports,
                            size: 60,
                            color: Colors.amber,
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Sign in to continue to your account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 40),

                          CustomTextField(
                            controller: _emailController,
                            label: 'Email or Username',
                            icon: Icons.person_outline,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty) {
                                return 'Please enter your email or username';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: AppSpacing.md),

                          CustomTextField(
                            controller: _passwordController,
                            label: 'Password',
                            icon: Icons.lock_outline,
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return 'Please enter your password';
                              }

                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 25),

                          PrimaryButton(
                            label: 'Login',
                            icon: Icons.login,
                            onPressed: _handleLogin,
                          ),

                          const SizedBox(height: 25),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              TextButton(
                                onPressed: _goToSignUp,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}