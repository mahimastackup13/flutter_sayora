import 'package:flutter/material.dart';
import 'package:sayoraaa/screens/MainNavigationScreen.dart';
import 'package:sayoraaa/screens/login_screen.dart';
import 'package:sayoraaa/screens/level_screen.dart';
import 'package:sayoraaa/screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'package:sayoraaa/screens/intro_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const SayoraApp());
}

class SayoraApp extends StatelessWidget {
  const SayoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/chat': (context) => const ChatScreen(),
        '/splash': (context) => const SplashScreen(),
        '/level': (context) => const LevelScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/introscreen': (context) => const IntroScreen(),
        '/mainNavigation': (context) => const MainNavigationScreen(),
      },
    );
  }
}
