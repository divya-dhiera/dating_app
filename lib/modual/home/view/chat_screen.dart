import 'package:datingapp/modual/home/view/bottom_navigation_screen.dart';
import 'package:datingapp/utility/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/common_text.dart';
import '../../../utility/text_style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController sendMsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => BottomNavigationScreen(indexSelected: 1));
        return true;
      },
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => BottomNavigationScreen(indexSelected: 1),
                          );
                        },
                        child: Icon(Icons.arrow_back_ios, size: 25),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/image_2.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Elizabeth",
                            style: tsBlack16w500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10),
                          Text("Online", style: tsGrey14w400),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/ic_video.png",
                        width: 35,
                        height: 33,
                      ),
                      SizedBox(width: 15),
                      Image.asset(
                        "assets/images/ic_phone.png",
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          surfaceTintColor: colorWhite,
          automaticallyImplyLeading: false,
          backgroundColor: colorWhite,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: 100,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  print("index ====>$index");
                  print("index 11 ====>${index + 1}");
                  print("index 22 ====>${index - 1}");
                  return Column(
                    children: [
                      Align(
                        alignment: index % 3 == 0
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: index % 3 == 0
                                ? Colors.grey.shade300
                                : Colors.blue.shade50,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(
                                index % 3 == 0 ? 0 : 10,
                              ),
                              bottomLeft: Radius.circular(
                                index % 3 == 0 ? 10 : 0,
                              ),
                            ),
                          ),
                          child: Text(
                            // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since",
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 15);
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: sendMsg,
                    cursorColor: colorBlack,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorBlack,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: AppText.send,
                      filled: false,
                      isDense: true,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorBlack,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 15,
                      ),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: colorBlack.withOpacity(0.8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: colorBlack.withOpacity(0.8),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: null,
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/ic_send_2.png",
                    height: 25,
                    width: 25,
                    color: colorBlack,
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(15),
      ),
    );
  }
}
