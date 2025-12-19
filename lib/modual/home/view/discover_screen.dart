import 'package:datingapp/modual/home/view/profile_screen.dart';
import 'package:datingapp/modual/home/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/common_color.dart';
import '../../../utility/common_text.dart';
import '../../../utility/text_style.dart';
import 'join_discover_screen.dart';
import 'notification_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        foregroundColor: colorPrimary,
        automaticallyImplyLeading: false,
        backgroundColor: colorPrimary,
        surfaceTintColor: colorPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: colorWhite, width: 2),
                    ),
                    padding: EdgeInsets.all(2),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/image_2.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(AppText.discover.toUpperCase(), style: tsWhite18w500),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                  child: Image.asset(
                    "assets/images/ic_filter.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(() => NotificationScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Image.asset(
                      "assets/images/ic_notification.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        children: [
          Text(AppText.vibe, style: tsBlack16w500),
          SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => JoinDiscoverScreen());
                  },
                  child: Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            index % 2 == 0
                                ? "assets/images/ic_meetUp.png"
                                : "assets/images/ic_party.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                colorBlack.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          bottom: 10,
                          right: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hook-Up \nMoment",
                                style: tsWhite20w500,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Lorem ipsum dolor sit a hook up moment",
                                style: tsWhite14w400,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(right: 10),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(AppText.check, style: tsBlack20w500),
          Text(AppText.based, style: tsBlack14w400),
          SizedBox(height: 20),
          SizedBox(
            height: 500,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => JoinDiscoverScreen());
                  },
                  child: Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            index % 2 == 0
                                ? "assets/images/ic_community.png"
                                : "assets/images/ic_branch.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                colorBlack.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          bottom: 10,
                          right: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                index % 2 == 0 ? "LGBTQ Community" : "Hang-out",
                                style: tsWhite20w500,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Lorem ipsum dolor sit a hook up moment",
                                style: tsWhite14w400,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
