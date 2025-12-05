# 🚀 Guide d'Installation - Application Mada

## 📋 Table des Matières

1. [Prérequis](#prérequis)
2. [Installation de Flutter](#installation-de-flutter)
3. [Configuration du Projet](#configuration-du-projet)
4. [Lancement de l'Application](#lancement-de-lapplication)
5. [Résolution des Problèmes](#résolution-des-problèmes)

---

## 1️⃣ Prérequis

### Système d'exploitation
- Windows 10/11 (64-bit)
- macOS 10.14 ou supérieur
- Linux (Ubuntu 18.04 ou supérieur)

### Outils nécessaires
- **Git** : [Télécharger Git](https://git-scm.com/downloads)
- **Android Studio** : [Télécharger Android Studio](https://developer.android.com/studio)
- **VS Code** (optionnel) : [Télécharger VS Code](https://code.visualstudio.com/)

---

## 2️⃣ Installation de Flutter

### Windows

1. **Télécharger Flutter SDK**
   ```bash
   # Téléchargez depuis : https://flutter.dev/docs/get-started/install/windows
   # Extrayez dans : C:\src\flutter
   ```

2. **Ajouter Flutter au PATH**
   - Ouvrez "Variables d'environnement"
   - Ajoutez `C:\src\flutter\bin` au PATH
   - Redémarrez le terminal

3. **Vérifier l'installation**
   ```bash
   flutter doctor
   ```

### macOS

1. **Télécharger Flutter SDK**
   ```bash
   cd ~/development
   curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.16.0-stable.zip
   unzip flutter_macos_3.16.0-stable.zip
   ```

2. **Ajouter Flutter au PATH**
   ```bash
   export PATH="$PATH:`pwd`/flutter/bin"
   echo 'export PATH="$PATH:~/development/flutter/bin"' >> ~/.zshrc
   ```

3. **Vérifier l'installation**
   ```bash
   flutter doctor
   ```

### Linux

1. **Télécharger Flutter SDK**
   ```bash
   cd ~/development
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz
   tar xf flutter_linux_3.16.0-stable.tar.xz
   ```

2. **Ajouter Flutter au PATH**
   ```bash
   export PATH="$PATH:~/development/flutter/bin"
   echo 'export PATH="$PATH:~/development/flutter/bin"' >> ~/.bashrc
   ```

3. **Vérifier l'installation**
   ```bash
   flutter doctor
   ```

---

## 3️⃣ Configuration du Projet

### Étape 1 : Extraire le projet

```bash
# Extraire l'archive
tar -xzf mada_app.tar.gz
cd mada_app
```

### Étape 2 : Installer les dépendances

```bash
# Installer toutes les dépendances
flutter pub get
```

### Étape 3 : Configuration Android Studio

1. **Installer Android Studio**
   - Téléchargez depuis [developer.android.com/studio](https://developer.android.com/studio)
   - Installez Android SDK

2. **Créer un émulateur**
   - Ouvrez Android Studio
   - Tools → Device Manager → Create Device
   - Choisissez Pixel 6 Pro
   - Téléchargez Android API 33 (Tiramisu)
   - Terminez la création

3. **Extensions Flutter**
   - File → Settings → Plugins
   - Recherchez "Flutter" et installez
   - Recherchez "Dart" et installez

### Étape 4 : Configuration VS Code (optionnel)

1. **Extensions nécessaires**
   - Flutter (Dart-Code)
   - Dart
   - Flutter Widget Snippets

2. **Configuration**
   ```json
   // .vscode/settings.json
   {
     "dart.flutterSdkPath": "chemin/vers/flutter",
     "dart.debugExternalPackageLibraries": true,
     "dart.debugSdkLibraries": false
   }
   ```

---

## 4️⃣ Lancement de l'Application

### Méthode 1 : Ligne de commande

```bash
# Lister les appareils disponibles
flutter devices

# Lancer l'app
flutter run

# Lancer en mode debug
flutter run --debug

# Lancer en mode release
flutter run --release
```

### Méthode 2 : Android Studio

1. Ouvrez Android Studio
2. File → Open → Sélectionnez le dossier `mada_app`
3. Attendez l'indexation
4. Sélectionnez un émulateur ou appareil
5. Cliquez sur le bouton "Run" (▶️)

### Méthode 3 : VS Code

1. Ouvrez VS Code
2. File → Open Folder → Sélectionnez `mada_app`
3. Ouvrez `lib/main.dart`
4. Appuyez sur F5 ou cliquez sur "Run and Debug"

---

## 5️⃣ Résolution des Problèmes

### Problème : "Flutter command not found"

**Solution :**
```bash
# Vérifiez que Flutter est dans le PATH
echo $PATH

# Ajoutez Flutter au PATH
export PATH="$PATH:/chemin/vers/flutter/bin"
```

### Problème : "Android license not accepted"

**Solution :**
```bash
flutter doctor --android-licenses
# Acceptez toutes les licences
```

### Problème : "No devices found"

**Solution :**
```bash
# Vérifiez les appareils
flutter devices

# Créez un émulateur
flutter emulators --create

# Lancez un émulateur
flutter emulators --launch <emulator_id>
```

### Problème : "Gradle build failed"

**Solution :**
```bash
# Nettoyez le projet
cd android
./gradlew clean
cd ..

# Reconstruisez
flutter clean
flutter pub get
flutter run
```

### Problème : "Package not found"

**Solution :**
```bash
# Supprimez le cache
flutter clean

# Réinstallez les dépendances
rm pubspec.lock
flutter pub get
```

### Problème : "Hot reload ne fonctionne pas"

**Solution :**
```bash
# Redémarrez l'application
# Dans le terminal où l'app tourne, tapez 'R'
R

# Ou redémarrez complètement
flutter run --hot
```

---

## 📱 Tester sur un Appareil Physique

### Android

1. **Activer le mode développeur**
   - Paramètres → À propos du téléphone
   - Tapez 7 fois sur "Numéro de build"

2. **Activer le débogage USB**
   - Paramètres → Options pour les développeurs
   - Activez "Débogage USB"

3. **Connecter l'appareil**
   ```bash
   # Vérifier la connexion
   adb devices
   
   # Lancer l'app
   flutter run
   ```

### iOS (Mac uniquement)

1. **Installer Xcode**
   - Téléchargez depuis l'App Store

2. **Configurer le développeur**
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

3. **Connecter l'iPhone**
   - Branchez l'iPhone
   - Faites confiance à l'ordinateur
   ```bash
   flutter run
   ```

---

## 🎨 Personnalisation

### Changer les couleurs

Modifiez `lib/utils/app_theme.dart` :
```dart
static const Color primaryColor = Color(0xFFD97757);
static const Color secondaryColor = Color(0xFFF4A261);
```

### Changer le nom de l'app

1. **Android** : `android/app/src/main/AndroidManifest.xml`
```xml
<application
    android:label="Mada"
    ...>
```

2. **iOS** : `ios/Runner/Info.plist`
```xml
<key>CFBundleName</key>
<string>Mada</string>
```

### Changer l'icône

Utilisez le package `flutter_launcher_icons` :
```bash
flutter pub add flutter_launcher_icons
flutter pub run flutter_launcher_icons
```

---

## 🚀 Compilation Release

### Android APK

```bash
# Build APK
flutter build apk --release

# APK disponible dans:
# build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle (pour Google Play)

```bash
# Build App Bundle
flutter build appbundle --release

# Bundle disponible dans:
# build/app/outputs/bundle/release/app-release.aab
```

### iOS

```bash
# Build iOS
flutter build ios --release

# Ouvrez Xcode pour l'archivage
open ios/Runner.xcworkspace
```

---

## 📞 Support

Pour toute aide supplémentaire :
- 📧 Email : contact@gdgmaroua.org
- 💬 Discord : [GDG Maroua](https://discord.gg/gdgmaroua)
- 📱 WhatsApp : +237 XXX XXX XXX

---

**Bonne chance avec le développement ! 🎉**
