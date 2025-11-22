import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';
import 'gemini_chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.green.withOpacity(0.3),
      end: Colors.green.withOpacity(0.7),
    ).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(AppText.welcome.toUpperCase(), style: tsBlack20w500),
              SizedBox(height: 2),
              Text("abcd".toUpperCase(), style: tsBlack20w500),
              SizedBox(height: 50),
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorRed,
                  ),
                  child: Center(
                    child: Text(AppText.find, style: tsWhite18w500),
                  ),
                ),
              ),
            ],
          ).paddingAll(15),
          Positioned(
            bottom: 15,
            right: 15,
            child: GestureDetector(
              onTap: () {
                Get.to(() => GeminiChatScreen());
              },
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: 1.0,
                          child: AnimatedSlide(
                            duration: Duration(milliseconds: 500),
                            offset: Offset(0, -0.1),
                            child: Text(
                              "ChatAI",
                              style: tsBlack16w500.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5, // modern style
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 0.1).animate(
                            CurvedAnimation(
                              parent: _controller!,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/ic_chatBot.png",
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
