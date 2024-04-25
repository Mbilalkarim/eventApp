import 'package:eventapp/Controller/get_di.dart';
import 'package:eventapp/utilities/app_size.dart';
import 'package:eventapp/utilities/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Controller/localNotification.dart';
import 'Views/splashScreen/SplashScreenView.dart';

Future<void> main() async {
  mainInit();

  await GetStorage.init();
  await LocalNotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      title: 'Emergency Pass Webapp',
      theme: light,
      supportedLocales: const [Locale("en"), Locale("de")],
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      home: SplashScreenView(),
    );
  }
}
