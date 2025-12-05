# 📱 Mada - Application d'Apprentissage de la Langue Mada

Une application mobile élégante et interactive pour apprendre la langue Mada, développée avec Flutter.

![Mada App](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Fonctionnalités

- 🎨 **Interface Magnifique** : Design moderne avec les couleurs signature de Claude AI (orange/corail)
- 🚀 **Splash Screen Animé** : Écran d'accueil avec animations fluides
- 📖 **Onboarding Interactif** : 4 écrans d'introduction pour guider les utilisateurs
- 📚 **13 Catégories** : Plus de 2500 mots organisés en catégories thématiques
- 🎯 **Suivi de Progression** : Suivez votre avancement dans chaque catégorie
- 🎵 **Audio Intégré** : Écoutez la prononciation correcte de chaque mot
- 🏆 **Système de Badges** : Gagnez des récompenses en progressant

## 🎨 Design

L'application utilise une palette de couleurs inspirée de Claude AI :
- **Couleur Principale** : #D97757 (Orange/Corail)
- **Couleur Secondaire** : #F4A261 (Orange clair)
- **Couleur d'Accent** : #E76F51 (Rouge-orange)
- **Fond** : #FAF9F6 (Beige très clair)

## 📦 Structure du Projet

```
mada_app/
├── lib/
│   ├── main.dart                    # Point d'entrée de l'application
│   ├── screens/
│   │   ├── splash_screen.dart       # Écran de démarrage
│   │   ├── onboarding_screen.dart   # Écrans d'introduction
│   │   └── home_screen.dart         # Écran d'accueil avec catégories
│   ├── widgets/                     # Widgets réutilisables
│   ├── models/                      # Modèles de données
│   ├── services/                    # Services (API, Database)
│   └── utils/
│       └── app_theme.dart           # Thème de l'application
├── assets/
│   ├── images/                      # Images de l'app
│   ├── icons/                       # Icônes personnalisées
│   └── fonts/                       # Polices personnalisées
└── pubspec.yaml                     # Dépendances du projet
```

## 🚀 Installation

### Prérequis

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code avec extensions Flutter
- Émulateur Android ou dispositif physique

### Étapes d'installation

1. **Cloner le projet**
```bash
cd mada_app
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Vérifier la configuration Flutter**
```bash
flutter doctor
```

4. **Lancer l'application**
```bash
flutter run
```

## 📚 Dépendances Principales

- **google_fonts** : Polices Google Fonts (Poppins)
- **flutter_animate** : Animations fluides et élégantes
- **provider** : Gestion d'état
- **shared_preferences** : Stockage local
- **sqflite** : Base de données locale
- **audioplayers** : Lecture audio
- **cached_network_image** : Mise en cache des images

## 🎯 Fonctionnalités à Venir

- [ ] Écran de détails des catégories
- [ ] Système de quiz interactif
- [ ] Enregistrement de la prononciation
- [ ] Mode hors ligne complet
- [ ] Synchronisation cloud
- [ ] Partage de progression
- [ ] Notifications de rappel
- [ ] Support multilingue (Français, Anglais)
- [ ] Mode sombre
- [ ] Récompenses et gamification

## 📊 Catégories Disponibles

1. **Famille & Relations** (80+ mots)
2. **Corps Humain** (150+ mots)
3. **Animaux** (250+ mots)
4. **Vêtements** (150+ mots)
5. **Nourriture** (200+ mots)
6. **Objets Quotidiens** (150+ mots)
7. **Nature** (250+ mots)
8. **Couleurs & Formes** (120+ mots)
9. **Nombres** (120+ mots)
10. **Salutations** (180+ expressions)
11. **Métiers** (200+ mots)
12. **Maison** (200+ mots)
13. **Verbes d'Action** (500+ verbes)

## 🔧 Configuration Avancée

### Ajouter des polices personnalisées

1. Placez vos fichiers de police dans `assets/fonts/`
2. Mettez à jour `pubspec.yaml` :

```yaml
fonts:
  - family: Poppins
    fonts:
      - asset: assets/fonts/Poppins-Regular.ttf
      - asset: assets/fonts/Poppins-Bold.ttf
        weight: 700
```

### Personnaliser les couleurs

Modifiez les couleurs dans `lib/utils/app_theme.dart` :

```dart
static const Color primaryColor = Color(0xFFD97757);
static const Color secondaryColor = Color(0xFFF4A261);
```

## 🤝 Contribution

Les contributions sont les bienvenues ! Pour contribuer :

1. Fork le projet
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📝 License

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👥 Auteurs

- **Touza** - *Développeur Principal* - École Nationale Supérieure Polytechnique de Maroua (ENSPM)
- **GDG Maroua** - *Support et Organisation*
- **Maroua Innovation Technology (MIT)** - *Partenaire Technique*

## 🙏 Remerciements

- La communauté Mada pour le contenu linguistique
- Les aînés pour la validation des traductions
- Google Developer Groups Maroua pour le soutien
- Tous les contributeurs et testeurs

## 📞 Contact

Pour toute question ou suggestion :
- Email : contact@gdgmaroua.org
- Twitter : @GDGMaroua
- Website : https://gdgmaroua.org

## 🌟 Support

Si vous aimez ce projet, n'hésitez pas à :
- ⭐ Mettre une étoile sur GitHub
- 🐛 Signaler des bugs
- 💡 Proposer de nouvelles fonctionnalités
- 📱 Partager l'application

---

**Fait avec ❤️ pour préserver et promouvoir la langue Mada**
