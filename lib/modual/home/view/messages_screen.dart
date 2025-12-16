import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/text_style.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(AppText.msg, style: tsBlack24w600),
              SizedBox(height: 30),
              TextFormField(
                controller: search,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colorBlack.withOpacity(0.9),
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: AppText.search,
                  isDense: true,
                  hintStyle: tsBlack16w500.copyWith(
                    color: colorBlack.withOpacity(0.4),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Image.asset(
                      "assets/images/ic_search.png",
                      height: 16,
                      width: 16,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: colorPrimary, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: colorPrimary, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: colorPrimary, width: 1),
                  ),
                ),
                // onChanged: _applySearchFilter,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/image_2.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ChatScreen());
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Elizabeth",
                                          style: tsBlack16w500,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text("1 hour", style: tsGrey14w400),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Ok, see you then.Ok, see you then.Ok, see you then.",
                                          style: tsBlack14w400,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colorPrimary,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "10",
                                            style: tsWhite12w400.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: colorGrey.withOpacity(0.5),
                        thickness: 0.6,
                      ).paddingOnly(left: 65),
                    ],
                  ).paddingOnly(bottom: 15);
                },
              ),
            ),
          ),
        ],
      ).paddingOnly(left: 15, right: 15, top: 15),
    );
  }
}
