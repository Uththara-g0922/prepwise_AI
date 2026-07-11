import 'package:flutter/material.dart';
import 'package:prepwise_ai/core/theme/app_colors.dart';
import 'package:prepwise_ai/core/theme/app_radius.dart';
// 1. LoginScreen import
import 'package:prepwise_ai/features/login/presentation/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),

                  Text(
                    "PrepWise AI",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Your Personal AI Interview Coach",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.large),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 18,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.large),
                      child: Image.asset(
                        'assets/images/robot.jpeg',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const SizedBox(
                    width: 300,
                    child: Text(
                      "Practice smarter with AI-powered mock interviews,\nreal-time feedback, and personalized insights.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ), // Default bodyMedium style
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: 230,
                    height: 56,
                    child: FilledButton.icon(
                      // 2. After click button navigate to the Login Screen
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text("Get Started"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Version 1.0",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
