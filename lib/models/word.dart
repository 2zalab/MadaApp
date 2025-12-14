/// Represents a word or phrase in the Mada language learning app.
///
/// Each word contains the Mada translation, French translation, pronunciation guide,
/// and optional example usage. Users learn words within specific categories.
class Word {
  /// Unique identifier for the word
  final int id;

  /// The word/phrase in the Mada language
  final String madaText;

  /// French translation of the word/phrase
  final String frenchText;

  /// Phonetic pronunciation guide (optional)
  final String? pronunciation;

  /// Example sentence or usage context (optional)
  final String? example;

  /// ID of the category this word belongs to
  final int categoryId;

  /// Whether the user has marked this word as learned
  final bool isLearned;

  /// Whether this word is marked as a favorite
  final bool isFavorite;

  /// Audio file path for pronunciation (optional)
  final String? audioPath;

  /// Creates a new Word instance.
  Word({
    required this.id,
    required this.madaText,
    required this.frenchText,
    this.pronunciation,
    this.example,
    required this.categoryId,
    this.isLearned = false,
    this.isFavorite = false,
    this.audioPath,
  });

  /// Creates a copy of this word with optional field updates.
  ///
  /// Useful for updating learning progress or favorite status.
  Word copyWith({
    int? id,
    String? madaText,
    String? frenchText,
    String? pronunciation,
    String? example,
    int? categoryId,
    bool? isLearned,
    bool? isFavorite,
    String? audioPath,
  }) {
    return Word(
      id: id ?? this.id,
      madaText: madaText ?? this.madaText,
      frenchText: frenchText ?? this.frenchText,
      pronunciation: pronunciation ?? this.pronunciation,
      example: example ?? this.example,
      categoryId: categoryId ?? this.categoryId,
      isLearned: isLearned ?? this.isLearned,
      isFavorite: isFavorite ?? this.isFavorite,
      audioPath: audioPath ?? this.audioPath,
    );
  }

  /// Converts this word to a JSON map for storage/serialization.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'madaText': madaText,
      'frenchText': frenchText,
      'pronunciation': pronunciation,
      'example': example,
      'categoryId': categoryId,
      'isLearned': isLearned ? 1 : 0,
      'isFavorite': isFavorite ? 1 : 0,
      'audioPath': audioPath,
    };
  }

  /// Creates a Word from a JSON map.
  ///
  /// Throws [ArgumentError] if required fields are missing.
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as int,
      madaText: json['madaText'] as String,
      frenchText: json['frenchText'] as String,
      pronunciation: json['pronunciation'] as String?,
      example: json['example'] as String?,
      categoryId: json['categoryId'] as int,
      isLearned: (json['isLearned'] as int?) == 1,
      isFavorite: (json['isFavorite'] as int?) == 1,
      audioPath: json['audioPath'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Word{id: $id, mada: $madaText, french: $frenchText, learned: $isLearned}';
  }
}
