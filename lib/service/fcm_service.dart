import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      print('User declined or has not granted permission');
      return;
    }

    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(initSettings);

    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print('Handling a background message: ${message.messageId}');
  }

  static void _handleForegroundMessage(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    showCustomNotification(
      title: message.notification?.title ?? 'New Notification',
      body: message.notification?.body ?? '',
    );
  }

  static void _handleMessage(RemoteMessage message) {
    print('Message opened: ${message.data}');
  }

  static Future<void> showCustomNotification({
    String title = 'Campus Clock',
    String body = '',
    BuildContext? context,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'campus_clock_channel',
      'Campus Clock Notifications',
      channelDescription: 'Notifications for attendance and updates',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
    const NotificationDetails details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _localNotifications.show(0, title, body, details);
  }

  static Future<void> sendNotificationToUser({
    required String userId,
    required String title,
    required String body,
    String? senderName,
    Map<String, dynamic>? additionalData,
  }) async {
    print('Sending notification to user: $userId');
    print('Additional data: $additionalData');
    await showCustomNotification(title: title, body: body);
  }
}
