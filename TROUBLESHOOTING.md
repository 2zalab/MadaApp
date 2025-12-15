# Guide de dépannage MadaApp

## ❌ Erreur : "Could not locate aapt" sur Android

### Diagnostic
Cette erreur indique que les Android build tools ne sont pas installés ou configurés correctement.

### Solutions

#### Option 1 : Installer Android SDK et build tools (Recommandé)

1. **Installer Android Studio**
   - Téléchargez depuis : https://developer.android.com/studio
   - Lancez l'installation et acceptez toutes les dépendances
   - Ouvrez Android Studio et allez dans `Tools > SDK Manager`

2. **Installer les composants nécessaires**
   Dans SDK Manager, installez :
   - ✅ Android SDK Platform (API 34 ou supérieur)
   - ✅ Android SDK Build-Tools (dernière version)
   - ✅ Android SDK Command-line Tools
   - ✅ Android Emulator (optionnel mais recommandé)

3. **Configurer les variables d'environnement**

   **Windows :**
   ```cmd
   setx ANDROID_HOME "C:\Users\VotreNom\AppData\Local\Android\Sdk"
   setx PATH "%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools"
   ```

   **macOS/Linux :**
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
   ```
   Ajoutez ces lignes à votre `~/.bashrc` ou `~/.zshrc`

4. **Vérifier l'installation**
   ```bash
   flutter doctor -v
   ```
   Vous devriez voir ✅ pour Android toolchain

5. **Redémarrer VS Code/Android Studio**

#### Option 2 : Utiliser le web pour tester rapidement (Alternative)

Si vous voulez tester l'application sans installer Android SDK :

```bash
# Activer le support web (si pas déjà fait)
flutter config --enable-web

# Lancer l'application web
flutter run -d chrome
```

#### Option 3 : Utiliser Windows Desktop (Windows uniquement)

```bash
# Activer le support Windows Desktop
flutter config --enable-windows-desktop

# Lancer l'application Windows
flutter run -d windows
```

### Vérifier les appareils disponibles

Avant de lancer l'app, vérifiez les appareils disponibles :

```bash
flutter devices
```

Vous devriez voir au moins un appareil :
- `Chrome (web)` - Navigateur web
- `Windows (desktop)` - Application Windows native
- `Android device` - Téléphone/émulateur Android (si SDK installé)

### Lancer l'application

**Méthode 1 : Depuis la ligne de commande**
```bash
# Choisir automatiquement un appareil
flutter run

# Choisir un appareil spécifique
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d <device-id>     # Android
```

**Méthode 2 : Depuis VS Code**
1. Ouvrez le projet dans VS Code
2. Appuyez sur F5 ou cliquez sur "Run > Start Debugging"
3. Sélectionnez l'appareil dans le menu déroulant en bas à droite

**Méthode 3 : Depuis Android Studio**
1. Ouvrez le projet dans Android Studio
2. Sélectionnez un appareil dans le menu déroulant en haut
3. Cliquez sur le bouton ▶️ Run

## 🔍 Commandes de diagnostic

### Vérifier la configuration Flutter
```bash
flutter doctor -v
```

### Lister tous les appareils
```bash
flutter devices
```

### Nettoyer et reconstruire
```bash
flutter clean
flutter pub get
flutter run
```

### Vérifier les dépendances
```bash
flutter pub outdated
```

## ⚠️ Problèmes courants

### "Android license status unknown"
```bash
flutter doctor --android-licenses
# Acceptez toutes les licences (tapez 'y')
```

### "Unable to locate Android SDK"
Installez Android Studio ou définissez ANDROID_HOME manuellement.

### "No connected devices"
- Pour Android : Lancez un émulateur ou connectez un appareil physique en mode développeur
- Pour Web : Assurez-vous que Chrome est installé
- Pour Windows : Le support devrait être automatique

### Dépendances manquantes après pull
```bash
flutter pub get
```

## 📱 Plateformes supportées

MadaApp supporte les plateformes suivantes :
- ✅ Android (nécessite Android SDK)
- ✅ iOS (nécessite macOS + Xcode)
- ✅ Web (Chrome, Firefox, Safari)
- ✅ Windows Desktop
- ✅ macOS Desktop
- ✅ Linux Desktop

## 🚀 Recommandations

**Pour le développement rapide :**
- Utilisez Chrome (web) - installation la plus simple
- Bon pour tester l'UI et la navigation

**Pour le développement complet :**
- Installez Android SDK + émulateur
- Permet de tester toutes les fonctionnalités natives
- Nécessite ~5 GB d'espace disque

**Pour la production :**
- Testez sur plusieurs plateformes
- Utilisez des appareils physiques pour les tests finaux
- Configurez les clés de signature pour la release

## 📞 Support

Si les problèmes persistent :
1. Vérifiez que Flutter SDK est à jour : `flutter upgrade`
2. Nettoyez le projet : `flutter clean && flutter pub get`
3. Consultez la documentation officielle : https://docs.flutter.dev/get-started/install
4. Vérifiez les issues GitHub du projet

---

**Dernière mise à jour :** Décembre 2024
**Version Flutter requise :** ≥ 3.0.0
