import 'package:datingapp/utility/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/common_text.dart';
import '../../../utility/text_style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        title: Text(AppText.notification, style: tsBlack22w600),
        backgroundColor: colorWhite,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        surfaceTintColor: colorWhite,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
                      style: tsBlack16w500.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Jul 23, 2021 at 09:34 AM", style: tsGrey14w400),
              SizedBox(height: 10),
              Divider(color: colorGrey.withOpacity(0.3), thickness: 0.5),
              SizedBox(height: 5),
            ],
          );
        },
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Image.asset(
      //         "assets/images/ic_empty_notify.png",
      //         height: 200,
      //       ),
      //     ),
      //     SizedBox(height: 30),
      //     Text(
      //       "Looks empty here...",
      //       style: tsBlack20w500.copyWith(fontWeight: FontWeight.w300),
      //     ),
      //     SizedBox(height: 10),
      //     Text(
      //       "You currently have no notification at the moment use the button below to initiate a chat with someone close to you.",
      //       style: tsBlack14w400.copyWith(
      //         fontSize: 13,
      //         color: colorBlack.withOpacity(0.6),
      //       ),
      //       textAlign: TextAlign.center,
      //     ).paddingOnly(right: 40, left: 40),
      //   ],
      // ),
    );
  }
}
