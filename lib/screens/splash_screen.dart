import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mada_app/utils/app_theme.dart';
import 'package:mada_app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future<void> _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const OnboardingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo animé
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              )
                  .animate()
                  .scale(
                    duration: 600.ms,
                    curve: Curves.easeOutBack,
                  )
                  .then()
                  .shimmer(
                    duration: 1200.ms,
                    color: Colors.white.withOpacity(0.3),
                  ),
              
              const SizedBox(height: 32),
              
              // Titre de l'app
              const Text(
                'Mada',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 600.ms)
                  .slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 8),
              
              // Sous-titre
              const Text(
                'Apprendre la langue Mada',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                ),
              )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 600.ms)
                  .slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 80),
              
              // Indicateur de chargement
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                  strokeWidth: 3,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .fadeIn(delay: 900.ms, duration: 600.ms),
              
              const SizedBox(height: 16),
              
              const Text(
                'Chargement...',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              )
                  .animate()
                  .fadeIn(delay: 1200.ms, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
