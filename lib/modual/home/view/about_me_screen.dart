import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/text_style.dart';
import 'add_photos_screen.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  bool isInterest = false;
  bool isMan = false;
  int? isSelected;
  RangeValues _values = const RangeValues(40, 100);
  RangeValues ageValue = const RangeValues(19, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 60),
          isInterest
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isInterest = false;
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: colorBlack,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(AppText.interest, style: tsBlack24w600),
                    SizedBox(height: 10),
                    Text("I am  a", style: tsGrey18w500),
                    SizedBox(height: 15),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMan = !isMan;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: isMan ? colorPrimary : colorWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Man",
                                  style: isMan ? tsWhite16w500 : tsBlack16w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMan = !isMan;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: isMan ? colorWhite : colorPrimary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Woman",
                                  style: isMan ? tsBlack16w500 : tsWhite16w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(AppText.amIn, style: tsGrey18w500),
                    SizedBox(height: 15),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 0;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: isSelected == 0
                                    ? colorPrimary
                                    : colorWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Man",
                                  style: isSelected == 0
                                      ? tsWhite16w500
                                      : tsBlack16w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 1;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: isSelected == 1
                                    ? colorPrimary
                                    : colorWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Woman",
                                  style: isSelected == 1
                                      ? tsWhite16w500
                                      : tsBlack16w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 2;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: isSelected == 2
                                    ? colorPrimary
                                    : colorWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Both",
                                  style: isSelected == 2
                                      ? tsWhite16w500
                                      : tsBlack16w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(AppText.height, style: tsGrey18w500),
                    SizedBox(height: 15),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsetsGeometry.only(top: 5, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Between ${_values.start.round().toString()} and ${_values.end.round().toString()} cm",
                            style: tsBlack14w400,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              showValueIndicator: ShowValueIndicator.never,
                            ),
                            child: RangeSlider(
                              min: 40,
                              max: 150,
                              divisions: 100,
                              values: _values,
                              activeColor: colorPrimary,
                              labels: RangeLabels(
                                _values.start.round().toString(),
                                _values.end.round().toString(),
                              ),
                              onChanged: (RangeValues newValues) {
                                setState(() {
                                  _values = newValues;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(AppText.age, style: tsGrey18w500),
                    SizedBox(height: 15),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsetsGeometry.only(top: 5, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Between ${ageValue.start.round().toString()} and ${ageValue.end.round().toString()} years",
                            style: tsBlack14w400,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              showValueIndicator: ShowValueIndicator.never,
                            ),
                            child: RangeSlider(
                              min: 19,
                              max: 50,
                              divisions: 100,
                              values: ageValue,
                              activeColor: colorPrimary,
                              labels: RangeLabels(
                                ageValue.start.round().toString(),
                                ageValue.end.round().toString(),
                              ),
                              onChanged: (RangeValues newValues) {
                                setState(() {
                                  ageValue = newValues;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.aboutMe, style: tsBlack24w600),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: containerColor,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          hint: Text(
                            AppText.short,
                            style: TextStyle(
                              fontSize: 14,
                              color: colorGrey.withOpacity(0.7),
                            ),
                          ),
                        ),
                        cursorColor: colorBlack,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(AppText.height, style: tsBlack16w500),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: containerColor,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          hint: Text(
                            AppText.height,
                            style: TextStyle(
                              fontSize: 14,
                              color: colorGrey.withOpacity(0.7),
                            ),
                          ),
                        ),
                        cursorColor: colorBlack,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(AppText.age, style: tsBlack16w500),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: containerColor,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          hint: Text(
                            AppText.age,
                            style: TextStyle(
                              fontSize: 14,
                              color: colorGrey.withOpacity(0.7),
                            ),
                          ),
                        ),
                        cursorColor: colorBlack,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 110,
        child: Column(
          children: [
            GestureDetector(
              onTap: isInterest == true
                  ? () {
                      Get.to(() => AddPhotosScreen());
                    }
                  : () {
                      setState(() {
                        isInterest = true;
                      });
                    },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    isInterest ? AppText.finish : AppText.next,
                    style: tsWhite16w500,
                  ),
                ),
              ),
            ),
            Text(AppText.benefit, style: tsGrey14w400),
          ],
        ),
      ),
    );
  }
}
