// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// void registerNotification() async {
//   // 1. Initialize the Firebase app
//   await Firebase.initializeApp();
//
//   // 2. Instantiate Firebase Messaging
//   var _messaging = FirebaseMessaging.instance;
//
//   // 3. On iOS, this helps to take the user permissions
//   NotificationSettings settings = await _messaging.requestPermission(
//     alert: true,
//     badge: true,
//     provisional: false,
//     sound: true,
//   );
//
//   Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print("Handling a background message: ${message.messageId}");
//   }
//
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print("Open App: ${message.messageId}");
//
//     // PushNotification notification = PushNotification(
//     //   title: message.notification?.title,
//     //   body: message.notification?.body,
//     // );
//     // setState(() {
//     //   _notificationInfo = notification;
//     //   _totalNotifications++;
//     // });
//   });
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print("listende");
//     // ...
//     // if (_notificationInfo != null) {
//     //   // For displaying the notification as an overlay
//     //   showSimpleNotification(
//     //     Text(_notificationInfo!.title!),
//     //     leading: NotificationBadge(totalNotifications: _totalNotifications),
//     //     subtitle: Text(_notificationInfo!.body!),
//     //     background: Colors.cyan.shade700,
//     //     duration: Duration(seconds: 2),
//     //   );
//     // }
//   });
//
//   RemoteMessage? initialMessage =
//       await FirebaseMessaging.instance.getInitialMessage();
//
//   if (initialMessage != null) {
//     // PushNotification notification = PushNotification(
//     //   title: initialMessage.notification?.title,
//     //   body: initialMessage.notification?.body,
//     // );
//     // setState(() {
//     //   _notificationInfo = notification;
//     //   _totalNotifications++;
//     // });
//   }
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');
//     // TODO: handle the received notifications
//     // For handling the received notifications
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   // Parse the message received
//     //   PushNotification notification = PushNotification(
//     //     title: message.notification?.title,
//     //     body: message.notification?.body,
//     //   );
//     //
//     //   setState(() {
//     //     _notificationInfo = notification;
//     //     _totalNotifications++;
//     //   });
//     // });
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }
//
// Future<String?> getToken() async {
//   String? fcmtoken;
//   FirebaseMessaging fcm = await FirebaseMessaging.instance;
//   fcmtoken = await fcm.getToken();
//   return fcmtoken;
// }
