import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../widgets/text_paste_dialog.dart';
import '../service/fcm_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> with TickerProviderStateMixin {
  int _selectedTab = 0;
  late TabController _tabController;
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
  }
  
  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
  }
  
  void _showSnackBar(String msg, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: isError ? Colors.red : Colors.green)
    );
  }
  
  Future<void> _sendMessageToUsers() async {
    _showSnackBar('Message feature - Coming soon');
  }
  
  void _exportData() => _showSnackBar('Export - Coming soon');
  void _sendAnnouncement() => _sendMessageToUsers();
  void _viewSecurityReport() => _showSnackBar('Security - Coming soon');
  void _clearSystemCache() => _showSnackBar('Cache cleared');
  void _backupDatabase() => _showSnackBar('Backup - Coming soon');
  void _viewAuditLogs() => _showSnackBar('Audit logs - Coming soon');
  void _showTextPasteDialog() => _showSnackBar('Paste text - Coming soon');
  void _showCourseSelection() => _showSnackBar('Course selection - Coming soon');
  void _deleteStudentsByYear() => _showSnackBar('Delete by year - Coming soon');
  void _deleteAllStudentData() => _showSnackBar('Delete all - Coming soon');
  void _autoUpdateSemester() => _showSnackBar('Auto semester - Coming soon');
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
            Tab(icon: Icon(Icons.people), text: 'Users'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Admin Dashboard', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _sendMessageToUsers, child: const Text('Send Message')),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: _exportData, child: const Text('Export Data')),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: _clearSystemCache, child: const Text('Clear Cache')),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: _autoUpdateSemester, child: const Text('Auto Semester')),
              ],
            ),
          ),
          const Center(child: Text('User Management - Coming Soon')),
          const Center(child: Text('Settings - Coming Soon')),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
