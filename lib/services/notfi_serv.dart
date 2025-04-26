import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
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
    static Future scheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required DateTime scheduledNotificationDateTime}) async {
    return flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,
        ),
        NotificationDetails(
            android: AndroidNotificationDetails("id 1", "base",importance: Importance.max,priority: Priority.high,sound: RawResourceAndroidNotificationSound("azan.mp3".split(".").first)),),
        // ignore: deprecated_member_use
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}

