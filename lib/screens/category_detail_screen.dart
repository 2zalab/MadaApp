import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mada_app/models/category.dart';
import 'package:mada_app/models/word.dart';

/// Screen displaying all words in a specific category.
///
/// Users can browse words, mark them as learned, add to favorites,
/// and listen to pronunciations.
class CategoryDetailScreen extends StatefulWidget {
  final Category category;

  const CategoryDetailScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late List<Word> _words;
  String _searchQuery = '';
  bool _showOnlyLearned = false;

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  /// Loads sample words for this category.
  ///
  /// In a production app, this would fetch from a database or API.
  void _loadWords() {
    // Sample words - in production, these would come from a database
    _words = _getSampleWords(widget.category.id);
  }

  /// Generates sample words for demonstration purposes.
  List<Word> _getSampleWords(int categoryId) {
    // Sample data based on category
    final Map<int, List<Map<String, String>>> sampleData = {
      1: [ // Famille & Relations
        {'mada': 'Baba', 'french': 'Papa', 'pronunciation': 'ba-ba'},
        {'mada': 'Mama', 'french': 'Maman', 'pronunciation': 'ma-ma'},
        {'mada': 'Dada', 'french': 'Grand frère', 'pronunciation': 'da-da'},
        {'mada': 'Didi', 'french': 'Petite sœur', 'pronunciation': 'di-di'},
        {'mada': 'Babu', 'french': 'Grand-père', 'pronunciation': 'ba-bu'},
        {'mada': 'Bibi', 'french': 'Grand-mère', 'pronunciation': 'bi-bi'},
      ],
      2: [ // Corps Humain
        {'mada': 'Loha', 'french': 'Tête', 'pronunciation': 'lo-ha'},
        {'mada': 'Maso', 'french': 'Œil', 'pronunciation': 'ma-so'},
        {'mada': 'Sofina', 'french': 'Nez', 'pronunciation': 'so-fi-na'},
        {'mada': 'Vava', 'french': 'Bouche', 'pronunciation': 'va-va'},
        {'mada': 'Tanana', 'french': 'Main', 'pronunciation': 'ta-na-na'},
      ],
      3: [ // Animaux
        {'mada': 'Alika', 'french': 'Chien', 'pronunciation': 'a-li-ka'},
        {'mada': 'Saka', 'french': 'Chat', 'pronunciation': 'sa-ka'},
        {'mada': 'Vorona', 'french': 'Oiseau', 'pronunciation': 'vo-ro-na'},
        {'mada': 'Bibilava', 'french': 'Canard', 'pronunciation': 'bi-bi-la-va'},
        {'mada': 'Omby', 'french': 'Vache', 'pronunciation': 'om-bi'},
      ],
    };

    final categoryWords = sampleData[categoryId] ?? [
      {'mada': 'Exemple', 'french': 'Exemple', 'pronunciation': 'ex-em-ple'},
    ];

    return categoryWords.asMap().entries.map((entry) {
      return Word(
        id: entry.key + (categoryId * 1000),
        madaText: entry.value['mada']!,
        frenchText: entry.value['french']!,
        pronunciation: entry.value['pronunciation'],
        categoryId: categoryId,
      );
    }).toList();
  }

  /// Filters words based on search query and learned status.
  List<Word> get _filteredWords {
    return _words.where((word) {
      final matchesSearch = _searchQuery.isEmpty ||
          word.madaText.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          word.frenchText.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFilter = !_showOnlyLearned || word.isLearned;
      return matchesSearch && matchesFilter;
    }).toList();
  }

  /// Toggles the learned status of a word.
  void _toggleLearned(Word word) {
    setState(() {
      final index = _words.indexWhere((w) => w.id == word.id);
      if (index != -1) {
        _words[index] = word.copyWith(isLearned: !word.isLearned);
      }
    });
  }

  /// Toggles the favorite status of a word.
  void _toggleFavorite(Word word) {
    setState(() {
      final index = _words.indexWhere((w) => w.id == word.id);
      if (index != -1) {
        _words[index] = word.copyWith(isFavorite: !word.isFavorite);
      }
    });
  }

  /// Plays audio pronunciation for the word.
  void _playPronunciation(Word word) {
    // In production, this would play audio using audioplayers or just_audio
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🔊 Prononciation: ${word.pronunciation ?? word.madaText}'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final learnedCount = _words.where((w) => w.isLearned).length;
    final progress = _words.isEmpty ? 0.0 : learnedCount / _words.length;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with category info
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: widget.category.color,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.category.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.category.color,
                      widget.category.color.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Icon(
                      widget.category.icon,
                      size: 64,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Progress card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Progression',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$learnedCount / ${_words.length}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: widget.category.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: widget.category.color.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation(widget.category.color),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(progress * 100).toStringAsFixed(0)}% complété',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn().slideY(begin: 0.1, end: 0),
            ),
          ),

          // Search and filter bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher un mot...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Appris'),
                    selected: _showOnlyLearned,
                    onSelected: (value) {
                      setState(() {
                        _showOnlyLearned = value;
                      });
                    },
                    selectedColor: widget.category.color.withOpacity(0.3),
                  ),
                ],
              ).animate().fadeIn().slideY(begin: 0.1, end: 0),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Word list
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final word = _filteredWords[index];
                  return _WordCard(
                    word: word,
                    categoryColor: widget.category.color,
                    onToggleLearned: () => _toggleLearned(word),
                    onToggleFavorite: () => _toggleFavorite(word),
                    onPlayPronunciation: () => _playPronunciation(word),
                  )
                      .animate(delay: Duration(milliseconds: 50 * index))
                      .fadeIn()
                      .slideX(begin: 0.1, end: 0);
                },
                childCount: _filteredWords.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

/// Card widget displaying a single word with interactive controls.
class _WordCard extends StatelessWidget {
  final Word word;
  final Color categoryColor;
  final VoidCallback onToggleLearned;
  final VoidCallback onToggleFavorite;
  final VoidCallback onPlayPronunciation;

  const _WordCard({
    required this.word,
    required this.categoryColor,
    required this.onToggleLearned,
    required this.onToggleFavorite,
    required this.onPlayPronunciation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: word.isLearned ? 0 : 2,
      color: word.isLearned ? Colors.grey.shade100 : null,
      child: InkWell(
        onTap: onPlayPronunciation,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          word.madaText,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: categoryColor,
                            decoration: word.isLearned
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          word.frenchText,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        if (word.pronunciation != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            '🗣️ ${word.pronunciation}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          word.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: word.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: onToggleFavorite,
                      ),
                      IconButton(
                        icon: Icon(
                          word.isLearned
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          color: word.isLearned ? categoryColor : Colors.grey,
                        ),
                        onPressed: onToggleLearned,
                      ),
                    ],
                  ),
                ],
              ),
              if (word.example != null) ...[
                const Divider(height: 16),
                Text(
                  word.example!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
