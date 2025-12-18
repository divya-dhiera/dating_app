import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';

class JoinDiscoverScreen extends StatefulWidget {
  const JoinDiscoverScreen({super.key});

  @override
  State<JoinDiscoverScreen> createState() => _JoinDiscoverScreenState();
}

class _JoinDiscoverScreenState extends State<JoinDiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/ic_community.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, colorBlack.withOpacity(0.6)],
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 50,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Want to Join LGBTQ \nCommunity?",
                    style: tsWhite20w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Find someone down for \nsomething spontaneous",
                    style: tsWhite14w400,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("Join", style: tsPrimary16w500)),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text("Not Now", style: tsWhite16w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
