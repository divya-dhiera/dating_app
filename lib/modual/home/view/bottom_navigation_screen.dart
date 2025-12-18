import 'package:datingapp/modual/home/view/request_screen.dart';
import 'package:flutter/material.dart';

import '../../../utility/common_color.dart';
import 'discover_screen.dart';
import 'messages_screen.dart';
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
        backgroundColor: bottomColor,
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
                selectedIndex == 0
                    ? "assets/images/ic_selected_home.png"
                    : "assets/images/ic_home.png",
                width: 27,
                height: 27,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                selectedIndex == 1
                    ? "assets/images/ic_selected_chat.png"
                    : "assets/images/ic_chat.png",
                width: 27,
                height: 27,
              ),
            ),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                selectedIndex == 2
                    ? "assets/images/ic_selected_like.png"
                    : "assets/images/ic_like.png",
                width: 27,
                height: 27,
              ),
            ),
            label: 'like',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                selectedIndex == 3
                    ? "assets/images/ic_selected_profile.png"
                    : "assets/images/ic_profile.png",
                width: 28,
                height: 28,
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
        return MessagesScreen();
      case 2:
        return RequestScreen();
      case 3:
        return DiscoverScreen();
      default:
        return SizedBox.shrink();
    }
  }
}
