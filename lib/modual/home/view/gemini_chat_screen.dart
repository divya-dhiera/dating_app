import 'package:datingapp/modual/home/view/bottom_navigation_screen.dart';
import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gemini_service.dart';

class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final GeminiService gemini = GeminiService();
  final TextEditingController sendMsg = TextEditingController();
  String reply = "";

  List<ChatMessage> messages = [];

  Future<void> sendMessage() async {
    final text = sendMsg.text.trim();
    if (text.isEmpty) return;

    sendMsg.clear();

    setState(() {
      messages.add(ChatMessage(text, true));
    });

    setState(() {
      messages.add(ChatMessage("...", false));
    });

    final typingIndex = messages.length - 1;

    final result = await gemini.askGemini(text);

    setState(() {
      messages[typingIndex] = ChatMessage(result, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => BottomNavigationScreen());
        return true;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ic_chatBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Get.to(() => BottomNavigationScreen());
                },
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: colorWhite,
                  size: 30,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return Align(
                      alignment: msg.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: msg.isUser
                              ? Colors.blue
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          msg.text,
                          style: TextStyle(
                            color: msg.isUser ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: sendMsg,
                      cursorColor: colorWhite.withOpacity(0.5),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorWhite.withOpacity(0.9),
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        hintText: AppText.send,
                        filled: false,
                        isDense: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colorWhite,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: colorWhite.withOpacity(0.8),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: colorWhite.withOpacity(0.8),
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
                    onTap: sendMessage,
                    child: Image.asset(
                      "assets/images/ic_send_2.png",
                      height: 25,
                      width: 25,
                      color: colorWhite,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingAll(15),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage(this.text, this.isUser);
}
