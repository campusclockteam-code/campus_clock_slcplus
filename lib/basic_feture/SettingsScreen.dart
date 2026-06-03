import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(value: false, onChanged: null),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
