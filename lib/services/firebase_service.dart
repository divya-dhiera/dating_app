// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static void initialize() {
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//       iOS: DarwinInitializationSettings(
//           requestAlertPermission: true,
//           requestBadgePermission: false,
//           requestSoundPermission: true),
//     );
//
//     _notificationsPlugin.initialize(
//       initializationSettings,
//       // onDidReceiveBackgroundNotificationResponse: (NotificationResponse notificationResponse) {
//       //   print("Notification on tap perform background");
//       // },
//       // onDidReceiveNotificationResponse:
//       //     (NotificationResponse notificationResponse) {
//       //   print("Notification on tap perform");
//       // },
//     );
//   }
// }