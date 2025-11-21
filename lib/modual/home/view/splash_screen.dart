import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/text_style.dart';
import '../../authentication/view/login_screen.dart';
import 'bottom_navigation_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      // if (getIsLogin()) {
      Get.offAll(() => BottomNavigationScreen());
      // } else {
      // Get.offAll(() => OnboardingScreen());
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red.shade200,
        child: Center(child: Text(AppText.appName, style: tsBlack24w600)),
      ),
    );
  }
}
