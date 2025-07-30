import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:buzz/login/splash_screen.dart';
import 'package:buzz/login/login.dart';
import '../notif/bubble_notification.dart';
import '../notif/priority.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  await initSystemNotification(onSelectNotification: (payload) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const Priority()),
    );
  });
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
      },
    );
  }
}