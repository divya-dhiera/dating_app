import 'dart:io';

import 'package:datingapp/modual/home/view/bottom_navigation_screen.dart';
import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utility/text_style.dart';

class AddPhotosScreen extends StatefulWidget {
  const AddPhotosScreen({super.key});

  @override
  State<AddPhotosScreen> createState() => _AddPhotosScreenState();
}

class _AddPhotosScreenState extends State<AddPhotosScreen> {
  final ImagePicker _editProfilePicker = ImagePicker();
  RxBool isEditFile = false.obs;

  // Rx<XFile> editDocFile = XFile("").obs;
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
            child: const Text("Camera"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _getFromGallery();
            },
            child: const Text("Gallery"),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
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
            child: const Text("Change Image"),
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
          child: const Text("Cancel"),
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
    return Scaffold(
      backgroundColor: colorWhite,
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.better,
              style: tsGrey14w400,
            ).paddingOnly(left: 15, right: 15),
            GestureDetector(
              onTap: () {
                Get.to(() => BottomNavigationScreen());
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(AppText.homePage, style: tsWhite16w500),
                ),
              ),
            ),
            Center(child: Text(AppText.benefit, style: tsGrey14w400)),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [

          SizedBox(height: 40),
          Text(AppText.photos, style: tsBlack24w600),
          SizedBox(height: 5),
          Text(AppText.identify, style: tsBlack14w400),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,childAspectRatio: 1.2
            ),
            itemBuilder: (context, index) {
              final XFile? image = selectedImages[index];
              return GestureDetector(
                onTap: () => pickImage(context, index),
                child: Container(
                  color: Colors.grey.shade300,
                  child: image == null
                      ? Icon(Icons.add, size: 40)
                      : GestureDetector(
                          onTap: () {
                            editImage(context, index);
                          },
                          child: Image.file(
                            File(image.path),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
