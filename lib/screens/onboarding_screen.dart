import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mada_app/utils/app_theme.dart';
import 'package:mada_app/screens/home_screen.dart';
import 'package:mada_app/models/onboarding_item.dart';

/// Onboarding carousel screen introducing new users to the app.
///
/// Displays a 4-page carousel showcasing the main features:
/// - Extensive vocabulary database (2500+ words)
/// - Audio pronunciations
/// - Progress tracking
/// - Offline learning capability
///
/// Users can swipe through pages or skip directly to the home screen.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Bienvenue sur Mada',
      description:
          'Découvrez et apprenez la langue Mada de manière simple, interactive et amusante.',
      icon: Icons.waving_hand_rounded,
      color: AppTheme.primaryColor,
    ),
    OnboardingItem(
      title: 'Apprenez par Catégories',
      description:
          'Plus de 2500 mots organisés en 13 catégories : famille, nature, animaux, nourriture et bien plus.',
      icon: Icons.category_rounded,
      color: AppTheme.secondaryColor,
    ),
    OnboardingItem(
      title: 'Écoutez et Pratiquez',
      description:
          'Écoutez la prononciation correcte de chaque mot et améliorez votre accent avec nos exercices.',
      icon: Icons.headphones_rounded,
      color: AppTheme.accentColor,
    ),
    OnboardingItem(
      title: 'Suivez votre Progression',
      description:
          'Suivez vos progrès, gagnez des badges et devenez un expert de la langue Mada !',
      icon: Icons.emoji_events_rounded,
      color: AppTheme.primaryColor,
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToHome();
    }
  }

  /// Skips the onboarding flow and navigates directly to home.
  void _skipOnboarding() {
    _navigateToHome();
  }

  /// Navigates to the home screen with error handling.
  ///
  /// Uses an animated page transition for smooth UX.
  void _navigateToHome() {
    try {
      // Check if widget is still mounted before navigating
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } catch (e) {
      // Log error and try fallback navigation
      debugPrint('Error navigating to home: $e');

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Bouton Skip
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _skipOnboarding,
                  child: Text(
                    'Passer',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),

            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(_items[index]);
                },
              ),
            ),

            // Indicateurs et bouton
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  // Indicateurs de page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _items.length,
                      (index) => _buildPageIndicator(index),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Bouton Suivant/Commencer
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _items[_currentPage].color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentPage == _items.length - 1
                            ? 'Commencer'
                            : 'Suivant',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.2, end: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icône
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  item.color,
                  item.color.withOpacity(0.7),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: item.color.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              item.icon,
              size: 80,
              color: Colors.white,
            ),
          )
              .animate()
              .scale(duration: 600.ms, curve: Curves.easeOutBack)
              .then()
              .shimmer(
                duration: 1500.ms,
                color: Colors.white.withOpacity(0.3),
              ),
          
          const SizedBox(height: 48),
          
          // Titre
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideY(begin: 0.3, end: 0),
          
          const SizedBox(height: 24),
          
          // Description
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                ),
          )
              .animate()
              .fadeIn(delay: 400.ms, duration: 600.ms)
              .slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 32 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? _items[_currentPage].color
            : AppTheme.textLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

