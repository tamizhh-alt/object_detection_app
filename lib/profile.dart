import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // Initialize the controllers with existing data if available
    _nameController.text = 'John Doe'; // Example data
    _emailController.text = 'john.doe@example.com'; // Example data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://www.example.com/profile-pic.jpg'), // Replace with actual profile image URL
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action
                  String name = _nameController.text;
                  String email = _emailController.text;
                  // Save the updated information
                  // For example, you might use a method to save the data to a backend or local storage
                  print('Name: $name, Email: $email');
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
