import 'package:flutter/material.dart';
import 'package:greengrocer/src/screens/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greengrocer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: SignInScreen(),
    );
  }
}
