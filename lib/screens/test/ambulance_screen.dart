import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;

class AmbulanceScreen extends StatelessWidget {
  AmbulanceScreen({Key? key}) : super(key: key);

  final fakerInstance = faker.Faker();

  // Egyptian ambulance service names
  final List<String> ambulanceNames = [
    'Egyptian Ambulance Organization',
    'Cairo Emergency Medical Service',
    'Resala Ambulance Service',
    'Al-Hayah Emergency Response',
    'Medical Care Ambulance',
    'Alexandria Urgent Care',
    'Delta Emergency Services',
    'Nile Valley Medical Response',
    'Falcon Ambulance Service',
    'Red Crescent Ambulance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Services'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search ambulance services...',
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
                _buildFilterChip('Air Ambulance'),
                _buildFilterChip('ICU Equipped'),
                _buildFilterChip('Fastest Response'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Ambulance list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                final name =
                    ambulanceNames[fakerInstance.randomGenerator.integer(
                      ambulanceNames.length,
                    )];
                final isAvailable = fakerInstance.randomGenerator.boolean();
                final estimatedTime =
                    fakerInstance.randomGenerator.integer(30) + 5;
                final distance =
                    fakerInstance.randomGenerator.integer(5000) + 100;
                final distanceText =
                    distance < 1000
                        ? '${distance}m away'
                        : '${(distance / 1000).toStringAsFixed(1)}km away';
                final hasIcuEquipment = fakerInstance.randomGenerator.boolean();

                return _buildAmbulanceCard(
                  name,
                  isAvailable,
                  estimatedTime,
                  distanceText,
                  hasIcuEquipment,
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

  Widget _buildAmbulanceCard(
    String name,
    bool isAvailable,
    int estimatedTime,
    String distance,
    bool hasIcuEquipment,
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
                  backgroundColor: Colors.red[100],
                  child: const Icon(Icons.local_taxi, color: Colors.red),
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
                          Icon(
                            Icons.access_time,
                            color: Colors.grey[700],
                            size: 14,
                          ),
                          Text(
                            ' ETA: $estimatedTime min',
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
                    color: isAvailable ? Colors.green[100] : Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isAvailable ? 'Available' : 'Busy',
                    style: TextStyle(
                      color: isAvailable ? Colors.green[800] : Colors.red[800],
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
                    Icon(
                      Icons.medical_services,
                      size: 16,
                      color: hasIcuEquipment ? Colors.red[700] : Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      hasIcuEquipment ? 'ICU Equipped' : 'Basic Equipment',
                      style: TextStyle(
                        fontSize: 12,
                        color: hasIcuEquipment ? Colors.red[700] : Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    minimumSize: const Size(100, 36),
                  ),
                  child: const Text('Call Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
