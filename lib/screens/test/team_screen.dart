import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Team'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meet The Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The awesome developers behind Tabebak',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: const [
                  // Ahmed Mohamed is now marked as the team leader
                  TeamMemberCard(
                    emoji: '👨‍💻',
                    name: 'Ahmed El-Shentenawy',
                    studentId: '2220039',
                    isLeader: true,
                  ),
                  TeamMemberCard(
                    emoji: '🔍',
                    name: 'Youssef Mohamed',
                    studentId: '2220535',
                  ),
                  TeamMemberCard(
                    emoji: '🎨',
                    name: 'Sama Bahaa',
                    studentId: '2220202',
                  ),
                  TeamMemberCard(
                    emoji: '📊',
                    name: 'Zeina Yasser',
                    studentId: '2220185',
                  ),
                  TeamMemberCard(
                    emoji: '🤖',
                    name: 'Ranim Mohamed',
                    studentId: '2220165',
                  ),

                  TeamMemberCard(
                    emoji: '🧠',
                    name: 'Rowan Mahmoud',
                    studentId: '2220171',
                  ),

                  TeamMemberCard(
                    emoji: '🔬',
                    name: 'Menna Abdo',
                    studentId: '2220484',
                  ),
                  TeamMemberCard(
                    emoji: '💻',
                    name: 'Sama Atef',
                    studentId: '2220203',
                  ),
                  TeamMemberCard(
                    emoji: '📱',
                    name: 'Youssef Hesham',
                    studentId: '2220541',
                  ),
                  TeamMemberCard(
                    emoji: '🚀',
                    name: 'Aml Sherif',
                    studentId: '2220081',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String emoji;
  final String name;
  final String studentId;
  final bool isLeader;

  const TeamMemberCard({
    Key? key,
    required this.emoji,
    required this.name,
    required this.studentId,
    this.isLeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: isLeader ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isLeader
            ? BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      color: isLeader ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3) : null,
      child: Padding(
        padding: EdgeInsets.all(isLeader ? 20.0 : 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: isLeader ? 70 : 60,
                  height: isLeader ? 70 : 60,
                  decoration: BoxDecoration(
                    color: isLeader
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: isLeader
                        ? [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: isLeader ? 36 : 30),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isLeader ? 20 : 18,
                        ),
                      ),
                      if (isLeader) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Team Leader',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 4),
                      Text(
                        'Student ID: $studentId',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      if (isLeader) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Project Coordinator & Lead Developer',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (isLeader)
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 24,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
