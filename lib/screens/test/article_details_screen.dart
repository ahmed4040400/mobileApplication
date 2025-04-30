import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final String title;
  final String date;
  final int readTime;

  const ArticleDetailsScreen({
    Key? key,
    required this.title,
    required this.date,
    required this.readTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Article Metadata
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[700]),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(width: 16),
                Icon(Icons.access_time, size: 16, color: Colors.grey[700]),
                const SizedBox(width: 6),
                Text(
                  '$readTime min read',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Article Introduction
          const Text(
            'This is a detailed article about health and wellness. It provides insights and tips to improve your overall health and well-being.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Article Section 1
          _buildArticleSection(
            'Understanding Your Health',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel augue vel est pulvinar elementum. Donec aliquam, nisi in semper aliquet, dolor magna condimentum mi, a scelerisque justo libero quis justo.',
          ),
          
          // Article Section 2
          _buildArticleSection(
            'Preventive Measures',
            'Nam euismod tincidunt ex, id auctor felis rutrum vel. Donec tempor risus vitae felis dictum, sed sollicitudin purus ultrices. Vivamus finibus tortor non ante tincidunt, non pellentesque risus pulvinar.',
          ),
          
          // Article Section 3
          _buildArticleSection(
            'Healthy Lifestyle Tips',
            'Fusce eget nibh at arcu finibus ornare. Aliquam erat volutpat. Integer tincidunt, enim at tempus fermentum, turpis dolor efficitur nisi, at feugiat dolor magna nec mauris.',
          ),
          
          const SizedBox(height: 20),
          
          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTag('Health'),
              _buildTag('Wellness'),
              _buildTag('Lifestyle'),
              _buildTag('Prevention'),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildArticleSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue[700],
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
