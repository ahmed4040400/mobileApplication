import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Official Emergency Services'),
          _buildEmergencyContactCard(
            'Ambulance',
            '123',
            Icons.medical_services,
            Colors.red,
            'National emergency ambulance service',
          ),
          _buildEmergencyContactCard(
            'Police',
            '122',
            Icons.local_police,
            Colors.blue.shade800,
            'Emergency police service',
          ),
          _buildEmergencyContactCard(
            'Fire Department',
            '180',
            Icons.fire_truck,
            Colors.orange.shade800,
            'Fire emergency service',
          ),
          _buildEmergencyContactCard(
            'Tourist Police',
            '126',
            Icons.travel_explore,
            Colors.green.shade700,
            'For tourists in emergency situations',
          ),
          _buildEmergencyContactCard(
            'Traffic Police',
            '128',
            Icons.traffic,
            Colors.amber.shade700,
            'Traffic accidents and emergencies',
          ),
          
          const SizedBox(height: 16),
          _buildSectionHeader('Healthcare Emergencies'),
          _buildEmergencyContactCard(
            'Poison Control Center',
            '0223654371',
            Icons.healing,
            Colors.purple,
            'Cairo University Hospitals',
          ),
          _buildEmergencyContactCard(
            'Blood Bank',
            '0222627740',
            Icons.bloodtype,
            Colors.red.shade900,
            'National Blood Transfusion Services',
          ),
          
          const SizedBox(height: 16),
          _buildSectionHeader('Personal Emergency Contacts'),
          _buildAddPersonalContactButton(),
          
          // Sample personal contacts
          _buildPersonalContactCard(
            'Dr. Mohamed Ibrahim',
            '01012345678',
            'Family Doctor',
            Icons.person_pin,
          ),
          _buildPersonalContactCard(
            'Cairo Hospital',
            '0223456789',
            'Local Hospital',
            Icons.local_hospital,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildEmergencyContactCard(
    String title,
    String number,
    IconData icon,
    Color color,
    String description,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(number, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () async {
            final url = 'tel:$number';
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text('Call', style: TextStyle(color: Colors.white)),
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildPersonalContactCard(
    String name,
    String number,
    String relation,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.blueGrey),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(relation, style: TextStyle(color: Colors.grey.shade700)),
            Text(number, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.call, color: Colors.green),
              onPressed: () async {
                final url = 'tel:$number';
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.blue),
              onPressed: () async {
                final url = 'sms:$number';
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPersonalContactButton() {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Function to add new personal emergency contact
          // Would typically open a form or contact picker
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              Icon(Icons.add_circle, color: Colors.blue, size: 24),
              SizedBox(width: 16),
              Text(
                'Add Personal Emergency Contact',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
