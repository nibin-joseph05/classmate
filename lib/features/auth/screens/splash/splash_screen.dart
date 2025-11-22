import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:classmate/features/auth/screens/welcome/welcome_screen.dart';
import 'package:classmate/core/theme/app_theme.dart';
import 'package:classmate/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _scale = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 1700), () {
      final authBox = Hive.box('authBox');
      final isLoggedIn = authBox.get('isLoggedIn', defaultValue: false);

      final nextPage = isLoggedIn ? const HomeScreen() : const WelcomeScreen();

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => nextPage,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: anim,
                curve: Curves.easeOut,
              ),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Center(
        child: ScaleTransition(
          scale: _scale,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/logo/app-icon-new.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "ClassMate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
