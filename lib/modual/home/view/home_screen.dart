import 'package:datingapp/modual/home/view/profile_screen.dart';
import 'package:datingapp/modual/home/view/setting_screen.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';
import 'gemini_chat_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Color?> _colorAnimation;
  bool isSwipe = false;

  // VideoPlayerController? _videoPlayerController;
  // int currentVideoIndex = 0;
  //
  // final List<String> videoUrls = [
  //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  //   'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  // ];
  //
  // final InAppPurchase _iap = InAppPurchase.instance;
  // List<ProductDetails> _products = [];

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

    // _initStoreInfo();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   loadVideo(currentVideoIndex);
    // });
  }

  // Future<void> _initStoreInfo() async {
  //   final bool available = await _iap.isAvailable();
  //   if (!available) return;
  //
  //   const Set<String> ids = {
  //     'test_premium_1',
  //     'test_remove_ads_1',
  //     'test_unlock_feature_1',
  //   };
  //
  //   final ProductDetailsResponse response = await _iap.queryProductDetails(ids);
  //
  //   if (response.error != null) {
  //     debugPrint("IAP Error: ${response.error}");
  //     return;
  //   }
  //
  //   setState(() {
  //     _products = response.productDetails;
  //   });
  // }

  // Future<void> loadVideo(int index) async {
  //   // if (!isPurchased) return;
  //
  //   await _videoPlayerController?.dispose();
  //
  //   final controller = VideoPlayerController.networkUrl(
  //     Uri.parse(videoUrls[index]),
  //   );
  //
  //   await controller.initialize();
  //   controller.play();
  //   controller.setLooping(false);
  //
  //   setState(() {
  //     _videoPlayerController = controller;
  //   });
  // }

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
    // _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        foregroundColor: colorPrimary,
        automaticallyImplyLeading: false,
        backgroundColor: colorPrimary,
        surfaceTintColor: colorPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileScreen());
                  },
                  child: Image.asset(
                    "assets/images/ic_placeholder.png",
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                Text(AppText.welcome.toUpperCase(), style: tsWhite18w500),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                  child: Image.asset(
                    "assets/images/ic_filter.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(() => NotificationScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Image.asset(
                      "assets/images/ic_notification.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.width,
              //   width: MediaQuery.of(context).size.width,
              //   child:
              //       _videoPlayerController != null &&
              //           _videoPlayerController!.value.isInitialized
              //       ? AspectRatio(
              //           aspectRatio: _videoPlayerController!.value.aspectRatio,
              //           child: VideoPlayer(_videoPlayerController!),
              //         )
              //       : const Center(child: CircularProgressIndicator()),
              // ),
              // SizedBox(height: 50),
              // GestureDetector(
              //   onTap: () {
              //     if (currentVideoIndex < videoUrls.length - 1) {
              //       currentVideoIndex++;
              //       loadVideo(currentVideoIndex);
              //     } else {
              //       _videoPlayerController?.dispose();
              //       Get.to(() => PurchaseScreen(products: _products));
              //     }
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: colorPrimary,
              //     ),
              //     child: Center(
              //       child: Text(AppText.find, style: tsWhite18w500),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppText.discover, style: tsBlack22w600),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSwipe = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSwipe == true
                                  ? colorPrimary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              "assets/images/ic_data.png",
                              width: 15,
                              color: isSwipe == true
                                  ? colorWhite
                                  : colorPrimary,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSwipe = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: isSwipe == true
                                  ? Colors.transparent
                                  : colorPrimary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              "assets/images/ic_swipe.png",
                              width: 15,
                              color: isSwipe == true
                                  ? colorPrimary
                                  : colorWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              isSwipe == true
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.71,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 2 / 3,
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 250,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/images/image_1.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            colorBlack.withOpacity(0.6),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 38,
                                            height: 38,
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: colorWhite,
                                            ),
                                            child: Image.asset(
                                              "assets/images/ic_cross.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            padding: EdgeInsets.all(11),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: colorPrimary,
                                            ),
                                            child: Image.asset(
                                              "assets/images/ic_orange_like.png",
                                              fit: BoxFit.fill,
                                              color: colorWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).paddingOnly(bottom: 15),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          child: CardSwiper(
                            cardsCount: 5,
                            backCardOffset: const Offset(0, -25),
                            scale: 0.93,
                            allowedSwipeDirection:
                                AllowedSwipeDirection.symmetric(
                                  horizontal: true,
                                ),
                            cardBuilder:
                                (
                                  context,
                                  index,
                                  percentThresholdX,
                                  percentThresholdY,
                                ) {
                                  return Transform.rotate(
                                    angle: percentThresholdX * 0.15,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          child: Image.asset(
                                            "assets/images/image_1.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.3),
                                                Colors.black.withOpacity(0.7),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (percentThresholdX > 0.15)
                                          Positioned(
                                            top: 40,
                                            left: 20,
                                            child: _swipeLabel(
                                              "LIKE",
                                              Colors.green,
                                            ),
                                          ),

                                        if (percentThresholdX < -0.15)
                                          Positioned(
                                            top: 40,
                                            right: 20,
                                            child: _swipeLabel(
                                              "NOPE",
                                              Colors.red,
                                            ),
                                          ),

                                        Positioned(
                                          bottom: 10,
                                          right: 10,
                                          left: 10,
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width -
                                                40, // IMPORTANT
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Rohini Wate",
                                                      style: tsWhite18w500
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 19,
                                                          ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: colorPrimary
                                                            .withOpacity(0.8),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        "21y",
                                                        style: tsWhite12w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "10 miles away",
                                                  style: tsWhite14w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                          ),
                        ),
                        Row(
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
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
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
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
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
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
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
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
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
                      ],
                    ),
            ],
          ).paddingOnly(right: 15,top: 15, left: 15,),
          Positioned(
            bottom: 15,
            right: 15,
            child: GestureDetector(
              onTap: () => Get.to(() => GeminiChatScreen()),
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: RotationTransition(
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

  Widget _swipeLabel(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
