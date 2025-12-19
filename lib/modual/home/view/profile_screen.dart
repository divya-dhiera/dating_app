import 'package:datingapp/modual/home/view/setting_screen.dart';
import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/text_style.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpanded = false;
  String aboutText =
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    "assets/images/image_2.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 15,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: colorWhite,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 15,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => EditProfileScreen());
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          "assets/images/ic_edit.png",
                          height: 25,
                          width: 25,
                          color: colorWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jessica Parker, 23", style: tsBlack22w600),
                  SizedBox(height: 2),
                  Text("Proffesional model", style: tsGrey14w400),
                  SizedBox(height: 25),
                  Text(AppText.aboutMe, style: tsBlack18w500),
                  SizedBox(height: 2),
                  Text(
                    aboutText,
                    style: tsGrey12w400,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () => setState(() => isExpanded = !isExpanded),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        aboutText.length >= 100
                            ? isExpanded
                                  ? "Read less"
                                  : "Read more"
                            : '',
                        style: TextStyle(
                          color: colorBlack,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppText.gender, style: tsBlack18w500),
                      Text("Female", style: tsGrey16w500),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppText.location, style: tsBlack18w500),
                      Text("Chicago, IL United States", style: tsGrey16w500),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppText.height, style: tsBlack18w500),
                      Text("175 cm / 5.9ft", style: tsGrey16w500),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(AppText.interests, style: tsBlack18w500),
                  SizedBox(height: 7),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPrimary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Travelling", style: tsBlack14w400),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPrimary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Books", style: tsBlack14w400),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPrimary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Dancing", style: tsBlack14w400),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPrimary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Modeling", style: tsBlack14w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: colorGrey.withOpacity(0.5), thickness: 0.5),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SettingScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/ic_support.png",
                              height: 22,
                            ),
                            SizedBox(width: 20),
                            Text(AppText.support, style: tsBlack22w600),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_sharp, size: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ).paddingAll(15),
            ],
          ),
        ],
      ),
    );
  }
}
