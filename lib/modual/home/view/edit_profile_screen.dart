import 'package:datingapp/modual/home/view/bottom_navigation_screen.dart';
import 'package:datingapp/utility/common_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utility/common_text.dart';
import '../../../utility/text_style.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  String? genderValue;

  final ImagePicker _editProfilePicker = ImagePicker();
  RxBool isEditFile = false.obs;
  Rx<XFile> editDocFile = XFile("").obs;
  XFile? editDoc;

  void pickImage(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                _getFromCamera();
              },
              child: const Text(
                "Camera",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                _getFromGallery();
              },
              child: const Text(
                "Gallery",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
          ),
        ),
      ),
    );
  }

  void _getFromGallery() async {
    editDoc = await _editProfilePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (editDoc != null) {
      editDocFile.value = editDoc!;
      isEditFile.value = true;
    }
  }

  void _getFromCamera() async {
    editDoc = await _editProfilePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (editDoc != null) {
      editDocFile.value = editDoc!;
      isEditFile.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => BottomNavigationScreen(indexSelected: 2));
        return true;
      },
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Text("Edit Profile", style: tsBlack22w600),
          backgroundColor: colorWhite,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.to(() => BottomNavigationScreen(indexSelected: 2));
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          surfaceTintColor: colorWhite,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          width: 150,
                          height: 150,
                          "assets/images/image_2.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickImage(context);
                          },
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: colorPrimary,
                              child: Image.asset(
                                "assets/images/ic_camera.png",
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(AppText.age, style: tsBlack16w500),
                SizedBox(height: 10),
                TextFormField(
                  controller: name,
                  style: tsBlack16w500.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter name",
                      style: tsGrey14w400.copyWith(fontSize: 15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: colorPrimary),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(AppText.age, style: tsBlack16w500),
                SizedBox(height: 10),
                TextFormField(
                  controller: age,
                  style: tsBlack16w500.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter age",
                      style: tsGrey14w400.copyWith(fontSize: 15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: colorPrimary),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(AppText.gender, style: tsBlack16w500),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colorPrimary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: genderValue,
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down_sharp, size: 30),
                      hint: Text(
                        "Select gender",
                        style: tsGrey14w400.copyWith(fontSize: 15),
                      ),
                      style: tsBlack16w500.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      items: [
                        DropdownMenuItem(value: 'male', child: Text("Male")),
                        DropdownMenuItem(
                          value: 'female',
                          child: Text("Female"),
                        ),
                        DropdownMenuItem(value: 'other', child: Text("Other")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          genderValue = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(() => BottomNavigationScreen());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorPrimary,
                    ),
                    child: Center(
                      child: Text(AppText.continues, style: tsWhite18w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
