import 'package:flutter/material.dart';

class SeeAllArticlesScreen extends StatefulWidget {
  const SeeAllArticlesScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllArticlesScreen> createState() => _SeeAllArticlesScreenState();
}

class _SeeAllArticlesScreenState extends State<SeeAllArticlesScreen> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Health', 'Nutrition', 'Fitness', 'Mental Health'];
  
  // List of article data with realistic names and categories
  final List<Map<String, dynamic>> articles = [
    {
      'title': 'Understanding Blood Pressure: What the Numbers Mean',
      'date': '12/03/2023',
      'category': 'Health'
    },
    {
      'title': 'Superfoods to Boost Your Immune System',
      'date': '05/04/2023',
      'category': 'Nutrition'
    },
    {
      'title': '30-Minute Home Workouts for Busy Professionals',
      'date': '22/04/2023',
      'category': 'Fitness'
    },
    {
      'title': 'Managing Stress in a Fast-Paced World',
      'date': '18/05/2023',
      'category': 'Mental Health'
    },
    {
      'title': 'Benefits of Preventive Health Checkups',
      'date': '03/06/2023',
      'category': 'Health'
    },
    {
      'title': 'Balanced Diet Myths Debunked',
      'date': '27/06/2023',
      'category': 'Nutrition'
    },
    {
      'title': 'Yoga for Beginners: Simple Poses to Start With',
      'date': '14/07/2023',
      'category': 'Fitness'
    },
    {
      'title': 'Sleep Habits for Better Mental Health',
      'date': '02/08/2023',
      'category': 'Mental Health'
    },
    {
      'title': 'Understanding Diabetes Risk Factors',
      'date': '25/08/2023',
      'category': 'Health'
    },
    {
      'title': 'Mindfulness Techniques for Daily Wellness',
      'date': '19/09/2023',
      'category': 'Wellness'
    },
  ];

  List<Map<String, dynamic>> get filteredArticles {
    if (selectedCategory == 'All') {
      return articles;
    } else {
      return articles.where((article) => article['category'] == selectedCategory).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Articles'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Category filter chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    checkmarkColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Article grid
          Expanded(
            child: filteredArticles.isEmpty 
              ? Center(
                  child: Text(
                    'No articles found for ${selectedCategory}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: filteredArticles.length,
                  itemBuilder: (context, index) {
                    final article = filteredArticles[index];
                    return _buildArticleCard(
                      context,
                      title: article['title'],
                      date: article['date'],
                      category: article['category'],
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(
    BuildContext context, {
    required String title,
    required String date,
    required String category,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to article details
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category tag with icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getCategoryIcon(category),
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Title
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Date and read more
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  
                  // Read more icon
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'health':
        return Icons.favorite;
      case 'nutrition':
        return Icons.restaurant;
      case 'fitness':
        return Icons.fitness_center;
      case 'mental health':
        return Icons.psychology;
      case 'wellness':
        return Icons.spa;
      default:
        return Icons.article;
    }
  }
}
