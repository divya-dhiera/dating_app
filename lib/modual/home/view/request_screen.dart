import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          backgroundColor: colorPrimary,
          foregroundColor: colorPrimary,
          surfaceTintColor: colorPrimary,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              padding: EdgeInsets.all(0),
              indicatorColor: Colors.transparent,
              dividerHeight: 0,
              labelPadding: EdgeInsets.zero,
              onTap: (value) {
                setState(() {
                  isSelected = value;
                });
              },
              tabs: [
                _tabItem(AppText.request, 0),
                _tabItem(AppText.poked, 1),
                _tabItem(AppText.accepted, 2),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 2,
          ),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/ic_nodata.png",
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                        Text(AppText.noRequest, style: tsGrey20w500),
                        Text(AppText.hooked, style: tsBlack14w400),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppText.gem, style: tsBlack18w500),
                            Image.asset(
                              "assets/images/ic_info.png",
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                          style: tsBlack14w400.copyWith(color: textColor),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          "assets/images/image_3.jpg",
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Shreya",
                                                      style: tsBlack16w500,
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "10 miles away",
                                                      style: tsGrey14w400
                                                          .copyWith(
                                                            color: textColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "9:00 pm",
                                                      style: tsGrey14w400,
                                                    ),
                                                    SizedBox(height: 3),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 5,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: colorPrimary,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                      ),

                                                      child: Center(
                                                        child: Text(
                                                          AppText.message,
                                                          style: tsWhite12w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 0.5,
                                              color: colorGrey.withOpacity(0.2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppText.hurray, style: tsBlack18w500),
                            Image.asset(
                              "assets/images/ic_info.png",
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                          style: tsBlack14w400.copyWith(color: textColor),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          "assets/images/image_3.jpg",
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Shreya",
                                                      style: tsBlack16w500,
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "10 miles away",
                                                      style: tsGrey14w400
                                                          .copyWith(
                                                            color: textColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "9:00 pm",
                                                      style: tsGrey14w400,
                                                    ),
                                                    SizedBox(height: 5),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 5,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: colorPrimary,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                      ),

                                                      child: Center(
                                                        child: Text(
                                                          AppText.message,
                                                          style: tsWhite12w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 0.5,
                                              color: colorGrey.withOpacity(0.2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem(String text, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected == index ? colorPrimary : colorWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: isSelected == index ? colorWhite : colorBlack,
          fontWeight: isSelected == index ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}
