import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
// SplashScreen එක import කරගන්න
import 'features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const PrepWiseAIApp());
}

class PrepWiseAIApp extends StatelessWidget {
  const PrepWiseAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PrepWise AI',
      theme: AppTheme.lightTheme,
      // Firstly show SplashScreen in app
      home: const SplashScreen(),
    );
  }
}
