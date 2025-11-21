import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/material.dart';
import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
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
          ),
        ],
      ),
    );
  }
}
