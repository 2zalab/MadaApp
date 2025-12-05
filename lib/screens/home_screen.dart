import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mada_app/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Category> _categories = [
    Category(
      id: 1,
      name: 'Famille & Relations',
      icon: Icons.family_restroom_rounded,
      color: const Color(0xFFFF6B6B),
      wordCount: 80,
      progress: 0.0,
    ),
    Category(
      id: 2,
      name: 'Corps Humain',
      icon: Icons.accessibility_new_rounded,
      color: const Color(0xFF4ECDC4),
      wordCount: 150,
      progress: 0.0,
    ),
    Category(
      id: 3,
      name: 'Animaux',
      icon: Icons.pets_rounded,
      color: const Color(0xFFFFD93D),
      wordCount: 250,
      progress: 0.0,
    ),
    Category(
      id: 4,
      name: 'Vêtements',
      icon: Icons.checkroom_rounded,
      color: const Color(0xFF6BCB77),
      wordCount: 150,
      progress: 0.0,
    ),
    Category(
      id: 5,
      name: 'Nourriture',
      icon: Icons.restaurant_rounded,
      color: const Color(0xFFFF8C42),
      wordCount: 200,
      progress: 0.0,
    ),
    Category(
      id: 6,
      name: 'Objets Quotidiens',
      icon: Icons.home_rounded,
      color: const Color(0xFF9B59B6),
      wordCount: 150,
      progress: 0.0,
    ),
    Category(
      id: 7,
      name: 'Nature',
      icon: Icons.nature_rounded,
      color: const Color(0xFF27AE60),
      wordCount: 250,
      progress: 0.0,
    ),
    Category(
      id: 8,
      name: 'Couleurs & Formes',
      icon: Icons.palette_rounded,
      color: const Color(0xFFE74C3C),
      wordCount: 120,
      progress: 0.0,
    ),
    Category(
      id: 9,
      name: 'Nombres',
      icon: Icons.calculate_rounded,
      color: const Color(0xFF3498DB),
      wordCount: 120,
      progress: 0.0,
    ),
    Category(
      id: 10,
      name: 'Salutations',
      icon: Icons.waving_hand_rounded,
      color: const Color(0xFFF39C12),
      wordCount: 180,
      progress: 0.0,
    ),
    Category(
      id: 11,
      name: 'Métiers',
      icon: Icons.work_rounded,
      color: const Color(0xFF8E44AD),
      wordCount: 200,
      progress: 0.0,
    ),
    Category(
      id: 12,
      name: 'Maison',
      icon: Icons.house_rounded,
      color: const Color(0xFF16A085),
      wordCount: 200,
      progress: 0.0,
    ),
    Category(
      id: 13,
      name: 'Verbes d\'Action',
      icon: Icons.directions_run_rounded,
      color: const Color(0xFFE67E22),
      wordCount: 500,
      progress: 0.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Bonjour ! 👋',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(begin: -0.2, end: 0),
                        
                        const SizedBox(height: 8),
                        
                        const Text(
                          'Apprends le Mada',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 200.ms, duration: 400.ms)
                            .slideX(begin: -0.2, end: 0),
                        
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Statistics Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(
                        icon: Icons.menu_book_rounded,
                        value: '2500+',
                        label: 'Mots',
                        color: AppTheme.primaryColor,
                      ),
                      _buildDivider(),
                      _buildStatItem(
                        icon: Icons.category_rounded,
                        value: '13',
                        label: 'Catégories',
                        color: AppTheme.secondaryColor,
                      ),
                      _buildDivider(),
                      _buildStatItem(
                        icon: Icons.emoji_events_rounded,
                        value: '0%',
                        label: 'Progression',
                        color: AppTheme.accentColor,
                      ),
                    ],
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 600.ms)
                  .slideY(begin: 0.2, end: 0),
            ),
          ),

          // Section Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Text(
                'Catégories',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 400.ms)
                  .slideX(begin: -0.2, end: 0),
            ),
          ),

          // Categories Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildCategoryCard(
                    _categories[index],
                    index,
                  );
                },
                childCount: _categories.length,
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 60,
      color: AppTheme.textLight.withOpacity(0.2),
    );
  }

  Widget _buildCategoryCard(Category category, int index) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          // Navigation vers les détails de la catégorie
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ouverture de ${category.name}...'),
              backgroundColor: category.color,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.1),
                category.color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: category.color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  category.icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              
              const Spacer(),
              
              // Category name
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 8),
              
              // Word count
              Row(
                children: [
                  Icon(
                    Icons.article_rounded,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${category.wordCount} mots',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: category.progress,
                  backgroundColor: AppTheme.textLight.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(category.color),
                  minHeight: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (800 + index * 100).ms, duration: 400.ms)
        .slideY(begin: 0.2, end: 0);
  }
}

class Category {
  final int id;
  final String name;
  final IconData icon;
  final Color color;
  final int wordCount;
  final double progress;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.wordCount,
    required this.progress,
  });
}
