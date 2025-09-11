import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  static int _notificationCounter = 0;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Notifications() {
    _loadNotificationSettings();
  }

  void _loadNotificationSettings() {
    const androidInitialize = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSItinialize = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false
    );

    const initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSItinialize
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({required String title, required String body, String? subtitle}) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'chanelID'
      ,'notification',
      channelDescription: 'This is for displaying changes notification',
      importance: Importance.max,
      priority: Priority.max
      );
    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      subtitle: subtitle,
      threadIdentifier: 'thread_id'
    );

    await flutterLocalNotificationsPlugin.show(
      _notificationCounter++,
      title,
      body,
      NotificationDetails(android: androidDetails, iOS: iosDetails)
      );
  }

}