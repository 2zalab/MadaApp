import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mada_app/utils/app_theme.dart';
import 'package:mada_app/screens/splash_screen.dart';

/// Entry point of the MadaApp application.
///
/// Configures system UI settings and locks orientation to portrait mode
/// before launching the app.
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Configuration de la barre de statut pour une apparence moderne
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Verrouiller l'orientation en portrait pour une expérience cohérente
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MadaApp());
}

/// Root widget of the MadaApp application.
///
/// Configures Material Design 3 theming and sets up the navigation
/// starting with the splash screen.
class MadaApp extends StatelessWidget {
  const MadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mada - Apprendre la langue Mada',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
