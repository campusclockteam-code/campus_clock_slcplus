import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.admin_panel_settings, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Admin Panel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Coming Soon...'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement admin features
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Admin features coming soon!')),
                );
              },
              child: const Text('Manage Users'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Analytics coming soon!')),
                );
              },
              child: const Text('View Analytics'),
            ),
          ],
        ),
      ),
    );
  }
}
