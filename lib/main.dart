import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modual/home/view/bottom_navigation_screen.dart';
import 'modual/home/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

GetStorage getStorage = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppText.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Roboto',
        // fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
