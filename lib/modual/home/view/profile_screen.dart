import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

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
        padding: EdgeInsets.all(15),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/ic_edit.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    width: 200,
                    height: 200,
                    "assets/images/image_2.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jessica Parker, 23", style: tsBlack22w600),
                      SizedBox(height: 2),
                      Text("Proffesional model", style: tsGrey14w400),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorWhite,
                      border: Border.all(color: colorGrey.withOpacity(0.5)),
                    ),
                    child: Image.asset(
                      "assets/images/ic_send_2.png",
                      width: 25,
                      height: 25,
                      color: colorPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(AppText.location, style: tsBlack18w500),
              SizedBox(height: 2),
              Text("Chicago, IL United States", style: tsGrey12w400),
              SizedBox(height: 25),
              Text(AppText.about, style: tsBlack18w500),
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
              SizedBox(height: 25),
              Text(AppText.interests, style: tsBlack18w500),
              SizedBox(height: 7),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Travelling", style: tsBlack14w400),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Books", style: tsBlack14w400),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Dancing", style: tsBlack14w400),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Modeling", style: tsBlack14w400),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
