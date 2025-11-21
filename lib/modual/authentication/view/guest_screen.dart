import 'package:datingapp/modual/authentication/view/login_screen.dart';
import 'package:datingapp/modual/home/view/bottom_navigation_screen.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  String? genderValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width / 6),
              Text(AppText.guestMode, style: tsBlack24w600),
              SizedBox(height: 30),
              Text(AppText.name, style: tsBlack16w500),
              SizedBox(height: 10),
              TextFormField(
                controller: name,
                style: tsBlack16w500.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter name",
                    style: tsGrey14w400.copyWith(fontSize: 15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: colorRed),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorRed),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorRed),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorRed),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(AppText.age, style: tsBlack16w500),
              SizedBox(height: 10),
              TextFormField(
                controller: age,
                style: tsBlack16w500.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter age",
                    style: tsGrey14w400.copyWith(fontSize: 15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: colorRed),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorRed),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorRed),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorRed),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(AppText.gender, style: tsBlack16w500),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorRed),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: genderValue,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_sharp, size: 30),
                    hint: Text(
                      "Select gender",
                      style: tsGrey14w400.copyWith(fontSize: 15),
                    ),
                    style: tsBlack16w500.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    items: [
                      DropdownMenuItem(value: 'male', child: Text("Male")),
                      DropdownMenuItem(value: 'female', child: Text("Female")),
                      DropdownMenuItem(value: 'other', child: Text("Other")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        genderValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(() => BottomNavigationScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorRed,
                  ),
                  child: Center(
                    child: Text(AppText.continues, style: tsWhite18w500),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: AppText.already,
                    style: tsBlack16w500,
                    children: [
                      TextSpan(
                        text: AppText.login,
                        style: tsBlack16w500.copyWith(color: colorRed),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => LoginScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
