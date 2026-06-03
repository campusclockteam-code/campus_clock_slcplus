import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.isFirstTime});
  final bool? isFirstTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            const Text('User Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Email: user@example.com'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
