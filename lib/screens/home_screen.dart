import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:faker/faker.dart' as faker;
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tabebak/screens/article_details_screen.dart';
import 'package:tabebak/screens/doctor_details_screen.dart';
import 'package:tabebak/screens/emergency_contacts_screen.dart';
import 'package:tabebak/screens/learn_more_screen.dart';
import 'package:tabebak/screens/see_all_articles_screen.dart';
import 'package:tabebak/screens/team_screen.dart';
import '../controllers/auth_controller.dart';
import 'doctor_list_screen.dart';
import 'pharmacy_screen.dart';
import 'hospital_screen.dart';
import 'ambulance_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.tabController}) : super(key: key);

  final PersistentTabController tabController;

  // Egyptian male first names
  static final List<String> egyptianMaleFirstNames = [
    'Ahmed',
    'Mohamed',
    'Mahmoud',
    'Ali',
    'Omar',
    'Mostafa',
    'Khaled',
    'Ibrahim',
    'Amr',
    'Ayman',
  ];

  // Egyptian female first names
  static final List<String> egyptianFemaleFirstNames = [
    'Nour',
    'Mariam',
    'Fatma',
    'Sara',
    'Aya',
    'Heba',
    'Mona',
    'Amira',
    'Dina',
    'Laila',
  ];

  // Egyptian last names
  static final List<String> egyptianLastNames = [
    'Mohamed',
    'Ahmed',
    'Ibrahim',
    'El-Masry',
    'El-Sayed',
    'Mahmoud',
    'Abdelrahman',
    'El-Sherif',
    'Mostafa',
    'Ali',
  ];

  @override
  Widget build(BuildContext context) {
    final fakerInstance = faker.Faker();

    return Scaffold(
      // AppBar is removed since it will be part of the bottom navigation flow
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome message at the top with team button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello, Ahmed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Find your desire health solution',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.people),
                      tooltip: 'Our Team',
                      onPressed: () {
                        Get.to(() => const TeamScreen());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryIcon(context, Icons.local_hospital, 'Doctor'),
                    _buildCategoryIcon(
                      context,
                      Icons.local_pharmacy,
                      'Pharmacy',
                    ),
                    _buildCategoryIcon(
                      context,
                      Icons.local_hospital,
                      'Hospital',
                    ),
                    _buildCategoryIcon(context, Icons.local_taxi, 'Ambulance'),
                  ],
                ),
                const SizedBox(height: 16),
                _buildBanner(),
                const SizedBox(height: 16),
                _buildSectionTitle('Top Doctor'),
                _buildDoctorList(),
                const SizedBox(height: 16),
                _buildSectionTitle('Health article'),
                _buildArticleList(),
                const SizedBox(height: 16),
                _buildSectionTitle('Emergency Contacts'),
                _buildEmergencyContactsBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Doctor') {
          Get.to(() => DoctorListScreen());
        } else if (label == 'Pharmacy') {
          Get.to(() => PharmacyScreen());
        } else if (label == 'Hospital') {
          Get.to(() => HospitalScreen());
        } else if (label == 'Ambulance') {
          Get.to(() => AmbulanceScreen());
        }
      },
      child: Column(
        children: [
          CircleAvatar(radius: 30, child: Icon(icon, size: 30)),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset('assets/doctor5.png', height: 170),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Early protection for your family health',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => LearnMoreScreen());
                  },
                  child: const Text('Learn more'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            if (title == 'Top Doctor') {
              Get.to(() => DoctorListScreen());
            } else if (title == 'Health article') {
              Get.to(() => SeeAllArticlesScreen());
            } else if (title == 'Emergency Contacts') {
              Get.to(() => EmergencyContactsScreen());
            }
          },
          child: const Text('See all'),
        ),
      ],
    );
  }

  Widget _buildDoctorList() {
    final fakerInstance = faker.Faker();

    // Generate a list of 5 random doctors
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          // Determine gender and select appropriate Egyptian name
          final gender =
              fakerInstance.randomGenerator.boolean() ? 'male' : 'female';

          String firstName;
          if (gender == 'male') {
            firstName =
                egyptianMaleFirstNames[fakerInstance.randomGenerator.integer(
                  egyptianMaleFirstNames.length,
                )];
          } else {
            firstName =
                egyptianFemaleFirstNames[fakerInstance.randomGenerator.integer(
                  egyptianFemaleFirstNames.length,
                )];
          }

          final lastName =
              egyptianLastNames[fakerInstance.randomGenerator.integer(
                egyptianLastNames.length,
              )];

          final doctorName = 'Dr. $firstName $lastName';

          // Select doctor image based on gender
          final doctorImage =
              gender == 'female'
                  ? (firstName.toLowerCase().contains('a')
                      ? 'assets/doctor2.png'
                      : 'assets/doctor3.png')
                  : 'assets/doctor.png';

          // List of specialties to randomly choose from
          final specialties = [
            'Cardiologist',
            'Dermatologist',
            'Pediatrician',
            'Orthopedist',
            'Neurologist',
            'Ophthalmologist',
            'Psychiatrist',
            'Gynecologist',
            'Urologist',
          ];

          final specialty =
              specialties[fakerInstance.randomGenerator.integer(
                specialties.length,
              )];

          // Generate a rating between 3.5 and 5.0
          final rating = 3.5 + fakerInstance.randomGenerator.decimal() * 1.5;

          // Generate a distance between 100m and 5km
          final distance = fakerInstance.randomGenerator.integer(5000) + 100;
          final distanceText =
              distance < 1000
                  ? '${distance}m away'
                  : '${(distance / 1000).toStringAsFixed(1)}km away';

          return _buildDoctorCard(
            doctorName,
            specialty,
            rating,
            distanceText,
            doctorImage,
          );
        },
      ),
    );
  }

  Widget _buildDoctorCard(
    String name,
    String specialty,
    double rating,
    String distance,
    String imageAsset,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DoctorDetailsScreen(
              name: name,
              specialty: specialty,
              rating: rating,
              distance: distance,
              imageAsset: imageAsset,
            ));
      },
      child: Card(
        margin: const EdgeInsets.only(right: 10),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(imageAsset),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                specialty,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Text(
                        ' ${rating.toStringAsFixed(1)}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    distance,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleList() {
    final fakerInstance = faker.Faker();

    // Generate a list of random health articles
    return Column(
      children: List.generate(3, (index) {
        // Generate fake article titles related to health
        final topics = [
          'health',
          'wellness',
          'fitness',
          'nutrition',
          'mental health',
          'sleep',
          'exercise',
          'diet',
        ];

        final randomTopic =
            topics[fakerInstance.randomGenerator.integer(topics.length)];
        final title =
            fakerInstance.lorem.sentence().replaceAll('.', '') +
            ' for better $randomTopic';

        // Generate random date in the last 30 days
        final date = DateTime.now().subtract(
          Duration(days: fakerInstance.randomGenerator.integer(30)),
        );
        final formattedDate = '${date.day}/${date.month}/${date.year}';

        return _buildArticleCard(
          title,
          formattedDate,
          fakerInstance.randomGenerator.integer(100) + 1,
        );
      }),
    );
  }

  Widget _buildArticleCard(String title, String date, int readTime) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(width: 16),
                Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '$readTime min read',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(() => ArticleDetailsScreen(title: title, date: date, readTime: readTime));
                },
                child: const Text('Read More'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContactsBanner() {
    return GestureDetector(
      onTap: () {
        Get.to(() => EmergencyContactsScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red.shade200),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.emergency,
                color: Colors.red.shade700,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emergency Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Quick access to emergency numbers and contacts',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red.shade800,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.red.shade700,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
