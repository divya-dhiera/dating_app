import 'package:carousel_slider/carousel_slider.dart';
import 'package:datingapp/modual/authentication/view/login_screen.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';
import '../../authentication/view/guest_screen.dart';
import '../../authentication/view/register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List images = [
    'assets/images/image_1.jpeg',
    'assets/images/image_2.jpeg',
    'assets/images/image_3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      bottomNavigationBar: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: AppText.account,
            style: tsBlack16w500,
            children: [
              TextSpan(
                text: AppText.register,
                style: tsBlack16w500.copyWith(color: colorRed),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() => RegisterScreen());
                  },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width / 5),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 4 / 3.8,
              viewportFraction: 0.7,
              initialPage: 0,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(i, fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Column(
            children: [
              Text(
                AppText.matches,
                style: tsBlack24w600.copyWith(color: colorRed),
              ),
              SizedBox(height: 10),
              Text(
                AppText.similar,
                style: tsBlack14w400,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorRed,
                  ),
                  child: Center(
                    child: Text(AppText.login, style: tsWhite18w500),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Get.to(() => GuestScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorRed,
                  ),
                  child: Center(
                    child: Text(AppText.guest, style: tsWhite18w500),
                  ),
                ),
              ),
            ],
          ).paddingOnly(right: 20, left: 20, top: 40),
        ],
      ),
    );
  }
}
