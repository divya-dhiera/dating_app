import 'package:datingapp/modual/home/view/purchase_screen.dart';

import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:video_player/video_player.dart';
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
  VideoPlayerController? _videoPlayerController;
  List<ProductDetails> _products = [];
  final InAppPurchase _iap = InAppPurchase.instance;

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
    _initStoreInfo();
    loadVideo(currentVideoIndex);
  }

  int currentVideoIndex = 0;

  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ];

  Future<void> _initStoreInfo() async {
    final bool available = await _iap.isAvailable();
    if (!available) return;

    const Set<String> ids = {
      'test_premium_1',
      'test_remove_ads_1',
      'test_unlock_feature_1',
    };

    final ProductDetailsResponse response = await _iap.queryProductDetails(ids);

    if (response.error != null) {
      print("Error loading products: ${response.error}");
      return;
    }

    _products = response.productDetails;
    print("Products Loaded: ${_products.length}");

    setState(() {});
  }

  void loadVideo(int index) async {
    _videoPlayerController?.dispose();

    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(videoUrls[index]),
    );

    await _videoPlayerController?.initialize();
    _videoPlayerController?.play();
    _videoPlayerController?.setLooping(false);

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    _videoPlayerController?.dispose();
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
              _videoPlayerController!.value.isInitialized
                  ? SizedBox(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                    )
                  : Container(),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  if (currentVideoIndex < videoUrls.length - 1) {
                    currentVideoIndex++;
                    loadVideo(currentVideoIndex);
                  } else {
                    Get.to(() => PurchaseScreen(products: _products));
                  }
                },
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
