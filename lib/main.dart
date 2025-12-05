import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mada_app/utils/app_theme.dart';
import 'package:mada_app/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configuration de la barre de statut
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Verrouiller l'orientation en portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MadaApp());
}

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
