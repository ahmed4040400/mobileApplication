import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;

class PharmacyScreen extends StatelessWidget {
  PharmacyScreen({Key? key}) : super(key: key);

  final fakerInstance = faker.Faker();

  // Egyptian pharmacy names
  final List<String> pharmacyNames = [
    'El-Ezaby Pharmacy',
    'Seif Pharmacy',
    '19011 Pharmacy',
    'El-Dawaa Pharmacy',
    'Roshdy Pharmacy',
    'Masr Pharmacy',
    'Al-Hayah Pharmacy',
    'City Pharmacy',
    'El-Nil Pharmacy',
    'Cairo Pharmacy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacies'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search pharmacies...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('All'),
                _buildFilterChip('Nearby'),
                _buildFilterChip('24 Hours'),
                _buildFilterChip('Delivery'),
                _buildFilterChip('Highest Rated'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Pharmacy list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                final name =
                    pharmacyNames[fakerInstance.randomGenerator.integer(
                      pharmacyNames.length,
                    )];
                final isOpen = fakerInstance.randomGenerator.boolean();
                final rating =
                    3.5 + fakerInstance.randomGenerator.decimal() * 1.5;
                final distance =
                    fakerInstance.randomGenerator.integer(5000) + 100;
                final distanceText =
                    distance < 1000
                        ? '${distance}m away'
                        : '${(distance / 1000).toStringAsFixed(1)}km away';
                final isDeliveryAvailable =
                    fakerInstance.randomGenerator.boolean();

                return _buildPharmacyCard(
                  name,
                  isOpen,
                  rating,
                  distanceText,
                  isDeliveryAvailable,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(label: Text(label), backgroundColor: Colors.grey[200]),
    );
  }

  Widget _buildPharmacyCard(
    String name,
    bool isOpen,
    double rating,
    String distance,
    bool isDeliveryAvailable,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.teal[100],
                  child: const Icon(Icons.local_pharmacy, color: Colors.teal),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          Text(
                            ' ${rating.toStringAsFixed(1)}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isOpen ? Colors.green[100] : Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isOpen ? 'Open' : 'Closed',
                    style: TextStyle(
                      color: isOpen ? Colors.green[800] : Colors.red[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      size: 16,
                      color: isDeliveryAvailable ? Colors.teal : Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isDeliveryAvailable
                          ? 'Delivery Available'
                          : 'No Delivery',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDeliveryAvailable ? Colors.teal : Colors.grey,
                      ),
                    ),
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text('Contact')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
