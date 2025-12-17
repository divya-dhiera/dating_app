import 'package:datingapp/utility/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/text_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        surfaceTintColor: colorWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Support", style: tsBlack22w600),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: colorBlack,
            size: 25,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 15, left: 15),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: colorGrey.withOpacity(0.3)),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/ic_share.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Share App", style: tsBlack16w500),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: colorGrey.withOpacity(0.3)),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/ic_like.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Feedback", style: tsBlack16w500),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: colorGrey.withOpacity(0.3)),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/ic_contact.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Contact Us", style: tsBlack16w500),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
