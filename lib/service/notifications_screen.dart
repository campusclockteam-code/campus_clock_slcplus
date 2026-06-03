import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, dynamic>> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    // Sample notifications - replace with actual data from Firebase
    _notifications = [
      {'title': 'Welcome!', 'body': 'Welcome to Campus Clock', 'read': false, 'timestamp': DateTime.now()},
      {'title': 'Attendance Reminder', 'body': 'Don\'t forget to mark your attendance', 'read': false, 'timestamp': DateTime.now().subtract(const Duration(hours: 2))},
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.checklist),
            onPressed: () {
              setState(() {
                for (var notification in _notifications) {
                  notification['read'] = true;
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All notifications marked as read')),
              );
            },
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No notifications yet', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: notification['read'] ? Colors.grey[300] : Colors.blue,
                      child: Icon(
                        Icons.notifications,
                        color: notification['read'] ? Colors.grey : Colors.white,
                      ),
                    ),
                    title: Text(
                      notification['title'],
                      style: TextStyle(
                        fontWeight: notification['read'] ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(notification['body']),
                    trailing: Text(
                      _formatTime(notification['timestamp']),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    onTap: () {
                      setState(() {
                        notification['read'] = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notification: ${notification['title']}')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
