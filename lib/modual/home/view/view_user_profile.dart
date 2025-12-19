import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/text_style.dart';

class ViewUserProfile extends StatefulWidget {
  const ViewUserProfile({super.key});

  @override
  State<ViewUserProfile> createState() => _ViewUserProfileState();
}

class _ViewUserProfileState extends State<ViewUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/image_3.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
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
                    color: colorBlack,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 50,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorWhite,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ic_cross.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 55,
                      height: 55,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorWhite,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ic_restart.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 55,
                      height: 55,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorWhite,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ic_star.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 55,
                      height: 55,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorWhite,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ic_orange_like.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Container(
                    //   width: 55,
                    //   height: 55,
                    //   padding: EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: colorPrimary,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black12,
                    //         blurRadius: 8,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Image.asset(
                    //     "assets/images/ic_selected_like.png",
                    //     fit: BoxFit.fill,
                    //     color: colorWhite,
                    //   ),
                    // ),
                  ],
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
                  Text("Rohini Wate”", style: tsBlack22w600),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("21y", style: tsWhite12w400),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    "assets/images/ic_work.png",
                    width: 18,
                    color: colorGrey,
                  ),
                  SizedBox(width: 8),
                  Text("Self Employed at Hotel", style: tsBlack14w400),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Image.asset(
                    "assets/images/ic_home.png",
                    width: 18,
                    color: colorGrey,
                  ),
                  SizedBox(width: 8),
                  Text("Lives in Nairobi", style: tsBlack14w400),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Image.asset(
                    "assets/images/ic_location.png",
                    width: 18,
                    color: colorGrey,
                  ),
                  SizedBox(width: 8),
                  Text("10 Kilometres Away", style: tsBlack14w400),
                ],
              ),
              SizedBox(height: 15),
              Text(
                AppText.about,
                style: tsBlack18w500.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Hac habitasse platea dictumst quisque sagittis purus sit amet volutpat. Donec enim diam vulputate ut. Congue eu consequat ac felis donec et odio. Et egestas quis ipsum suspendisse.",
                style: tsBlack14w400,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.gallery,
                    style: tsBlack18w500.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppText.see,
                    style: tsPrimary16w500.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child: Image.asset(
                      "assets/images/image_3.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Divider(color: colorGrey.withOpacity(0.3)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.share,
                    style: tsBlack20w500.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                    color: colorBlack,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: colorGrey.withOpacity(0.3)),
              SizedBox(height: 10),
              Text(
                "Report Rohini Wate",
                style: tsPrimary20w500.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
            ],
          ).paddingAll(15),
        ],
      ),
    );
  }
}
