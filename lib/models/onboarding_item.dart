import 'package:flutter/material.dart';

/// Represents a single page/screen in the onboarding carousel.
///
/// The onboarding screens introduce new users to the app's main features
/// and benefits before they reach the home screen.
class OnboardingItem {
  /// Title text displayed prominently on the onboarding page
  final String title;

  /// Detailed description explaining the feature or benefit
  final String description;

  /// Icon representing the feature visually
  final IconData icon;

  /// Color theme for this onboarding page
  final Color color;

  /// Creates a new OnboardingItem instance.
  ///
  /// All parameters are required to ensure complete onboarding content.
  OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  /// Creates a copy of this onboarding item with optional field updates.
  OnboardingItem copyWith({
    String? title,
    String? description,
    IconData? icon,
    Color? color,
  }) {
    return OnboardingItem(
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'OnboardingItem{title: $title}';
  }
}
