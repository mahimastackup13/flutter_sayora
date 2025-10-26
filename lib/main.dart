//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sayoraaa/screens/MainNavigationScreen.dart';
import 'package:sayoraaa/screens/login_screen.dart';
import 'package:sayoraaa/screens/level_screen.dart';
import 'package:sayoraaa/screens/splash_screen.dart';
import 'package:sayoraaa/screens/home_screen.dart';
import 'package:sayoraaa/screens/intro_screen.dart';
import 'package:sayoraaa/screens/profile_screen.dart';
import 'package:sayoraaa/screens/chat_screen.dart';
import 'package:sayoraaa/provider/chat_provider.dart';
import 'package:sayoraaa/services/supabase_auth_service.dart';
import 'package:sayoraaa/services/supabase_config.dart';
import'package:sayoraaa/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseConfig.initialize();

  runApp(const SayoraApp());
}

class SayoraApp extends StatelessWidget {
  const SayoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
         ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/chat': (context) => const ChatScreen(),
          '/splash': (context) => const SplashScreen(),
          '/level': (context) => const LevelScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/introscreen': (context) => const IntroScreen(),
          '/mainNavigation': (context) => const MainNavigationScreen(initialIndex: 0,),
          '/signup': (context) => const SignUpScreen(),
        },
      ),
    );
  }
}
