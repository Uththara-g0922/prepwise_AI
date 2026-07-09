import 'package:flutter/material.dart';
import 'package:prepwise_ai/features/splash/presentation/splash_screen.dart';
import 'core/theme/app_theme.dart';


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
      home: const SplashScreen(
        
      ),
    );
  }
}