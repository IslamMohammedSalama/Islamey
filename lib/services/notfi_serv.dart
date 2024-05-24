import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifservice {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            linux: LinuxInitializationSettings(defaultActionName: "Open"));
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void showNotification(
      {int id = 0,required String? title,required String? body, String? payLoad}) async {
    return flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
         NotificationDetails(
            android: AndroidNotificationDetails("id 1", "base",importance: Importance.max,priority: Priority.high,sound: RawResourceAndroidNotificationSound("azan.mp3".split(".").first)),));
  }
}

