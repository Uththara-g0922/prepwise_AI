import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
// 1. Import your new login screen file here
import 'features/login/presentation/login_screen.dart';

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
      // 2. Change this line from SplashScreen() to LoginScreen()
      home: const LoginScreen(),
    );
  }
}
