import 'package:datingapp/modual/home/view/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../utility/common_color.dart';
import 'chat_screen.dart';
import 'home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  int? indexSelected;

  BottomNavigationScreen({super.key, this.indexSelected});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.indexSelected ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorPrimary,
        selectedLabelStyle: TextStyle(
          color: colorBlack,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/ic_home.png",
                width: 30,
                height: 30,
                color: selectedIndex == 0
                    ? colorBottom
                    : colorBlack.withOpacity(0.6),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/ic_list.png",
                width: 30,
                height: 30,
                color: selectedIndex == 1
                    ? colorBottom
                    : colorBlack.withOpacity(0.6),
              ),
            ),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/ic_profile.png",
                width: 28,
                height: 28,
                color: selectedIndex == 2
                    ? colorBottom
                    : colorBlack.withOpacity(0.6),
              ),
            ),
            label: 'profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: currentScreen,
    );
  }

  Widget get currentScreen {
    switch (selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return ChatScreen();
      case 2:
        return ProfileScreen();
      case 3:
        return HomeScreen();
      default:
        return SizedBox.shrink();
    }
  }
}
