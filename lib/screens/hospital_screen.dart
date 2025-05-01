import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;

class HospitalScreen extends StatelessWidget {
  HospitalScreen({Key? key}) : super(key: key);

  final fakerInstance = faker.Faker();

  // Egyptian hospital names
  final List<String> hospitalNames = [
    'Cairo University Hospital',
    'Ain Shams University Hospital',
    'El-Salam International Hospital',
    'Dar Al Fouad Hospital',
    'Al-Andalusia Hospital',
    'El-Nile Badrawi Hospital',
    'Saudi German Hospital',
    'Air Force Specialized Hospital',
    'Al-Gamal Hospital',
    'International Medical Center',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitals'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search hospitals...',
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
                _buildFilterChip('Emergency'),
                _buildFilterChip('Specialized'),
                _buildFilterChip('Highest Rated'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Hospital list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                final name =
                    hospitalNames[fakerInstance.randomGenerator.integer(
                      hospitalNames.length,
                    )];
                final isEmergencyAvailable =
                    fakerInstance.randomGenerator.boolean();
                final rating =
                    3.5 + fakerInstance.randomGenerator.decimal() * 1.5;
                final distance =
                    fakerInstance.randomGenerator.integer(5000) + 100;
                final distanceText =
                    distance < 1000
                        ? '${distance}m away'
                        : '${(distance / 1000).toStringAsFixed(1)}km away';
                final departments =
                    fakerInstance.randomGenerator.integer(6) + 3;

                return _buildHospitalCard(
                  name,
                  isEmergencyAvailable,
                  rating,
                  distanceText,
                  departments,
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

  Widget _buildHospitalCard(
    String name,
    bool isEmergencyAvailable,
    double rating,
    String distance,
    int departments,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue[100],
                  child: const Icon(Icons.local_hospital, color: Colors.blue),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                          Flexible(
                            child: Text(
                              distance,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isEmergencyAvailable
                            ? Colors.red[100]
                            : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isEmergencyAvailable ? 'ER' : 'No ER',
                    style: TextStyle(
                      color:
                          isEmergencyAvailable
                              ? Colors.red[800]
                              : Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 8.0,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.category, size: 16, color: Colors.blue[700]),
                    const SizedBox(width: 4),
                    Text(
                      '$departments Depts',
                      style: TextStyle(fontSize: 12, color: Colors.blue[700]),
                    ),
                  ],
                ),
                const Spacer(),
                Wrap(
                  spacing: 8.0,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        minimumSize: const Size(60, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Details',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        minimumSize: const Size(60, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Call', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
