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
  int currentVideoIndex = 0;

  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ];

  final InAppPurchase _iap = InAppPurchase.instance;
  List<ProductDetails> _products = [];

  // bool isPurchased = false;

  @override
  void initState() {
    super.initState();

    // isPurchased = true; // testing only

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.green.withOpacity(0.3),
      end: Colors.green.withOpacity(0.7),
    ).animate(_controller!);

    _initStoreInfo();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (isPurchased && mounted) {
      loadVideo(currentVideoIndex);
      // }
    });
  }

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
      debugPrint("IAP Error: ${response.error}");
      return;
    }

    setState(() {
      _products = response.productDetails;
    });
  }

  Future<void> loadVideo(int index) async {
    // if (!isPurchased) return;

    await _videoPlayerController?.dispose();

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrls[index]),
    );

    await controller.initialize();
    controller.play();
    controller.setLooping(false);

    setState(() {
      _videoPlayerController = controller;
    });
  }

  // Widget _buildVideoPlayer() {
  //   if (_videoPlayerController == null ||
  //       !_videoPlayerController!.value.isInitialized) {
  //     return const SizedBox(
  //       height: 300,
  //       child: Center(child: CircularProgressIndicator()),
  //     );
  //   }
  //
  //   return AspectRatio(
  //     aspectRatio: _videoPlayerController!.value.aspectRatio,
  //     child: VideoPlayer(_videoPlayerController!),
  //   );
  // }
  //
  // Widget _buildPurchaseGate() {
  //   return Container(
  //     height: 300,
  //     width: double.infinity,
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade100,
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         const Text(
  //           "Purchase Required 🔒",
  //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(height: 10),
  //         const Text(
  //           "Complete your first purchase to unlock videos.",
  //           textAlign: TextAlign.center,
  //         ),
  //         const SizedBox(height: 20),
  //         ElevatedButton(
  //           onPressed: () async {
  //             final result = await Get.to(
  //               () => PurchaseScreen(products: _products),
  //             );
  //
  //             if (result == true) {
  //               setState(() {
  //                 isPurchased = true;
  //               });
  //               loadVideo(currentVideoIndex);
  //             }
  //           },
  //           child: const Text("Buy Now"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
              SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child:
                    _videoPlayerController != null &&
                        _videoPlayerController!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController!),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),

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
                    color: colorPrimary,
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
              onTap: () => Get.to(() => GeminiChatScreen()),
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
                        Text(
                          "ChatAI",
                          style: tsBlack16w500.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
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
