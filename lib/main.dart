import 'package:flutter/material.dart';

void main() {
  runApp(const PrepWiseAIApp());
}

class PrepWiseAIApp extends StatelessWidget {
  const PrepWiseAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("PrepWise AI"),
        ),
      ),
    );
  }
}