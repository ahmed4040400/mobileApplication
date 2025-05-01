import 'package:flutter/material.dart';

class LearnMoreScreen extends StatelessWidget {
  const LearnMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More'),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header section with icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.health_and_safety, 
                    size: 40, 
                    color: Theme.of(context).primaryColor),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Protect Your Family\'s Health',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Description card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              'Health is wealth. Early protection and regular checkups can ensure a healthy life for you and your loved ones. Learn about the best practices and tips to maintain a healthy lifestyle.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Benefits section
          const Text(
            'Benefits of Early Protection:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          _buildBenefitItem(context, Icons.calendar_today, 'Regular health checkups'),
          _buildBenefitItem(context, Icons.search, 'Early detection of diseases'),
          _buildBenefitItem(context, Icons.healing, 'Better management of chronic conditions'),
          _buildBenefitItem(context, Icons.favorite_border, 'Peace of mind for you and your family'),
          
          const SizedBox(height: 24),
          
          // Call to action button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Schedule a Checkup Today',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBenefitItem(BuildContext context, IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
