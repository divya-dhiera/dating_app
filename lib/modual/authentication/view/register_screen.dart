import 'package:datingapp/modual/authentication/view/otp_screen.dart';
import 'package:datingapp/modual/home/view/onboarding_screen.dart';
import 'package:datingapp/utility/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_multi_formatter/widgets/country_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utility/common_color.dart';
import '../../../utility/common_text.dart';
import '../../../utility/text_style.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? genderValue;
  PhoneCountryData? _initialCountryData;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => OnboardingScreen());
        return true;
      },
      child: Scaffold(
        backgroundColor: colorWhite,
        body: ListView(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 10),
                GestureDetector(
                  onTap: () {
                    Get.to(() => OnboardingScreen());
                  },
                  child: Icon(Icons.arrow_back_ios_new_sharp),
                ),
                SizedBox(height: 20),
                Text(
                  AppText.create,
                  style: tsBlack18w500.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(AppText.name, style: tsBlack16w500),
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
                SizedBox(height: 15),
                Text(AppText.phone, style: tsBlack16w500),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colorPrimary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        padding: const EdgeInsets.only(left: 10),
                        child: CountryDropdown(
                          printCountryName: true,
                          iconSize: 0,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          initialCountryData:
                              PhoneCodes.getPhoneCountryDataByCountryCode('IN'),
                          onCountrySelected: (PhoneCountryData countryData) {
                            setState(() {
                              _initialCountryData = countryData;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          controller: phone,
                          style: tsBlack14w400.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: _initialCountryData
                                ?.phoneMaskWithoutCountryCode,
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.3),
                            ),
                            errorStyle: const TextStyle(color: Colors.red),
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            PhoneInputFormatter(
                              allowEndlessPhone: false,
                              defaultCountryCode:
                                  _initialCountryData?.countryCode,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (name.text.isEmpty || name.text == "") {
                      Fluttertoast.showToast(
                        msg: "Please enter name",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 14.0,
                        backgroundColor: colorBlack.withOpacity(0.6),
                      );
                    } else if (age.text.isEmpty || age.text == "") {
                      Fluttertoast.showToast(
                        msg: "Please enter age",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 14.0,
                        backgroundColor: colorBlack.withOpacity(0.6),
                      );
                    } else if (genderValue == null || genderValue == "") {
                      Fluttertoast.showToast(
                        msg: "Please select gender",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 14.0,
                        backgroundColor: colorBlack.withOpacity(0.6),
                      );
                    } else if (phone.text.isEmpty || phone.text == "") {
                      Fluttertoast.showToast(
                        msg: "Please enter phone number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 14.0,
                        backgroundColor: colorBlack.withOpacity(0.6),
                      );
                    } else {
                      Map<String, dynamic> params = {
                        "name": name.value.text,
                        "phone": phone.value.text,
                        "age": age.value.text,
                        "gender": genderValue,
                      };
                      // kAuthController.registrationApi(params, () {
                      Get.to(() => OtpScreen(number: phone.value.text));
                      // });
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
                      child: Text(AppText.continues, style: tsWhite18w500),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppText.already,
                      style: tsBlack16w500,
                      children: [
                        TextSpan(
                          text: AppText.login,
                          style: tsBlack16w500.copyWith(color: colorPrimary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => LoginScreen());
                            },
                        ),
                      ],
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
