import 'package:chat_app/api/firebase_api.dart';
import 'package:chat_app/controller/acount_controller.dart';
import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/controller/controller.dart';
import 'package:chat_app/splashscreen/spalsh_screen.dart';
import 'package:chat_app/view/notification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  Get.put(ChatControll());
  Get.put(ChatSupport());
  Get.put(AccountController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:const  Splash(),
      navigatorKey: navigatorKey,

      routes: {
        NotificationScreen.route:(context)=>const NotificationScreen()
      },
    );
  }
}
