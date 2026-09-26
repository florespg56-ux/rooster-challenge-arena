import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/auth_background.dart';
import '../widgets/gradient_hero_icon.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
  if (!_formKey.currentState!.validate()) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Account created successfully!'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
    ),
  );

  Future.delayed(const Duration(seconds: 1), () {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
      arguments: HomeScreenArgs(
        name: _nameController.text.trim(),
      ),
    );
  });
}

void _goBackToLogin() {
  Navigator.pop(context);
}

void _goHomeScreen() {
  Navigator.pushReplacementNamed(
    context,
    AppRoutes.home,
    arguments: HomeScreenArgs(
      name: _nameController.text.trim(),
    ),
  );
}
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Row(
      children: [
        // LEFT SIDE
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
                color: Colors.black.withOpacity(0.5),
              ),

              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.groups,
                      color: Colors.amber,
                      size: 70,
                    ),

                    SizedBox(height: 20),

                    Text(
                      'JOIN\nROOSTER\nCHALLENGE\nWag papahuli sa laban!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      'Create your account and start\nmanaging tournament matches.',
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

        // RIGHT SIDE
        Expanded(
          flex: 4,
          child: Container(
            color: const Color(0xFF0F172A),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 380,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed:  _goBackToLogin,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Icon(
                          Icons.person_add_alt_1,
                          size: 60,
                          color: Colors.amber,
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Register to access the platform',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 40),

                        CustomTextField(
                          controller: _nameController,
                          label: 'Full Name',
                          icon: Icons.badge_outlined,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.email_outlined,
                          keyboardType:
                              TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter your email';
                            }

                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          controller: _passwordController,
                          label: 'Password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty) {
                              return 'Please enter a password';
                            }

                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          controller:
                              _confirmPasswordController,
                          label: 'Confirm Password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty) {
                              return 'Please confirm your password';
                            }

                            if (value !=
                                _passwordController.text) {
                              return 'Passwords do not match';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 25),

                        PrimaryButton(
                          label: 'Create Account',
                          icon: Icons.person_add,
                          onPressed: _handleSignUp,
                        ),

                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            TextButton(
                              onPressed: _goBackToLogin,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
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