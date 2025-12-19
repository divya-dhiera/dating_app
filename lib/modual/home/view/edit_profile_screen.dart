import 'dart:io';

import 'package:datingapp/modual/home/view/bottom_navigation_screen.dart';
import 'package:datingapp/utility/common_color.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController boi = TextEditingController();
  RangeValues _values = const RangeValues(40, 100);
  RangeValues ageValue = const RangeValues(19, 30);

  int? isSelected;
  String? genderValue;
  final ImagePicker _editProfilePicker = ImagePicker();
  RxBool isEditFile = false.obs;

  List<XFile?> selectedImages = List<XFile?>.filled(6, null);

  XFile? editDoc;

  int selectedIndex = -1;

  void pickImage(BuildContext context, int index) {
    selectedIndex = index;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _getFromCamera();
            },
            child: const Text(AppText.camera),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _getFromGallery();
            },
            child: const Text(AppText.gallery),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(AppText.cancel),
        ),
      ),
    );
  }

  void _getFromGallery() async {
    final XFile? image = await _editProfilePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image != null && selectedIndex != -1) {
      setState(() {
        selectedImages[selectedIndex] = image;
      });
    }
  }

  void _getFromCamera() async {
    final XFile? image = await _editProfilePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (image != null && selectedIndex != -1) {
      setState(() {
        selectedImages[selectedIndex] = image;
      });
    }
  }

  void editImage(BuildContext context, int index) {
    selectedIndex = index;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              pickImage(context, index);
            },
            child: const Text(AppText.change),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              deleteImage(index);
            },
            child: const Text(AppText.remove),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(AppText.cancel),
        ),
      ),
    );
  }

  void deleteImage(int index) {
    setState(() {
      selectedImages[index] = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Text(AppText.edit, style: tsBlack22w600),
          backgroundColor: colorWhite,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
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
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final XFile? image = selectedImages[index];
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () => pickImage(context, index),
                          child: Container(
                            width: 180,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                            ),

                            child: image == null
                                ? SizedBox()
                                : GestureDetector(
                                    onTap: () {
                                      editImage(context, index);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(image.path),
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        image == null
                            ? Positioned(
                                bottom: 5,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () => pickImage(context, index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorPrimary,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 20,
                                    width: 20,
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset(
                                      "assets/images/ic_add.png",
                                      color: colorWhite,
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                bottom: 5,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    editImage(context, index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorPrimary,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 25,
                                    width: 25,
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset(
                                      "assets/images/ic_photo_edit.png",
                                      color: colorWhite,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  AppText.complete,
                  textAlign: TextAlign.center,
                  style: tsGrey14w400,
                ),
                SizedBox(height: 20),
                Text(AppText.aboutMe, style: tsBlack22w600),
                SizedBox(height: 20),
                TextFormField(
                  controller: fName,
                  style: tsBlack16w500.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hint: Text(
                      "First name",
                      style: tsGrey14w400.copyWith(fontSize: 15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: colorBlack),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: lName,
                  style: tsBlack16w500.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hint: Text(
                      "Last name",
                      style: tsGrey14w400.copyWith(fontSize: 15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: colorBlack),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: boi,
                  style: tsBlack16w500.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter Bio",
                      style: tsGrey14w400.copyWith(fontSize: 15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: colorBlack),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(AppText.interest, style: tsBlack24w600),
                SizedBox(height: 10),
                Text(AppText.amIn, style: tsGrey18w500),
                SizedBox(height: 15),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = 0;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: isSelected == 0 ? colorPrimary : colorWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Man",
                              style: isSelected == 0
                                  ? tsWhite16w500
                                  : tsBlack16w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = 1;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: isSelected == 1 ? colorPrimary : colorWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Woman",
                              style: isSelected == 1
                                  ? tsWhite16w500
                                  : tsBlack16w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = 2;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: isSelected == 2 ? colorPrimary : colorWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Both",
                              style: isSelected == 2
                                  ? tsWhite16w500
                                  : tsBlack16w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(AppText.height, style: tsGrey18w500),
                SizedBox(height: 15),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsetsGeometry.only(top: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Between ${_values.start.round().toString()} and ${_values.end.round().toString()} cm",
                        style: tsBlack14w400,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          showValueIndicator: ShowValueIndicator.never,
                        ),
                        child: RangeSlider(
                          min: 40,
                          max: 150,
                          divisions: 100,
                          values: _values,
                          activeColor: colorPrimary,
                          labels: RangeLabels(
                            _values.start.round().toString(),
                            _values.end.round().toString(),
                          ),
                          onChanged: (RangeValues newValues) {
                            setState(() {
                              _values = newValues;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(AppText.age, style: tsGrey18w500),
                SizedBox(height: 15),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsetsGeometry.only(top: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Between ${ageValue.start.round().toString()} and ${ageValue.end.round().toString()} years",
                        style: tsBlack14w400,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          showValueIndicator: ShowValueIndicator.never,
                        ),
                        child: RangeSlider(
                          min: 19,
                          max: 50,
                          divisions: 100,
                          values: ageValue,
                          activeColor: colorPrimary,
                          labels: RangeLabels(
                            ageValue.start.round().toString(),
                            ageValue.end.round().toString(),
                          ),
                          onChanged: (RangeValues newValues) {
                            setState(() {
                              ageValue = newValues;
                            });
                          },
                        ),
                      ),
                    ],
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
                      child: Text(AppText.update, style: tsWhite18w500),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
