import 'package:flutter/material.dart';

/// Represents a learning category in the MadaApp.
///
/// Each category contains a collection of words/phrases related to a specific topic
/// (e.g., Family, Animals, Food). Users progress through categories by learning
/// and practicing the vocabulary.
class Category {
  /// Unique identifier for the category
  final int id;

  /// Display name of the category (e.g., "Famille & Relations")
  final String name;

  /// Icon to display for this category
  final IconData icon;

  /// Color theme for this category's UI elements
  final Color color;

  /// Total number of words/phrases in this category
  final int wordCount;

  /// Progress percentage (0.0 to 1.0) indicating how much of this category
  /// the user has completed
  final double progress;

  /// Creates a new Category instance.
  ///
  /// All parameters are required to ensure data integrity.
  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.wordCount,
    required this.progress,
  });

  /// Creates a copy of this category with optional field updates.
  ///
  /// This is useful for updating progress or other mutable fields while
  /// maintaining immutability.
  Category copyWith({
    int? id,
    String? name,
    IconData? icon,
    Color? color,
    int? wordCount,
    double? progress,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      wordCount: wordCount ?? this.wordCount,
      progress: progress ?? this.progress,
    );
  }

  /// Converts this category to a JSON map for storage/serialization.
  ///
  /// Note: IconData and Color are stored as code points and hex values.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iconCodePoint': icon.codePoint,
      'colorValue': color.value,
      'wordCount': wordCount,
      'progress': progress,
    };
  }

  /// Creates a Category from a JSON map.
  ///
  /// Throws [ArgumentError] if required fields are missing.
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: IconData(
        json['iconCodePoint'] as int,
        fontFamily: 'MaterialIcons',
      ),
      color: Color(json['colorValue'] as int),
      wordCount: json['wordCount'] as int,
      progress: (json['progress'] as num).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Category{id: $id, name: $name, wordCount: $wordCount, progress: ${(progress * 100).toStringAsFixed(1)}%}';
  }
}
