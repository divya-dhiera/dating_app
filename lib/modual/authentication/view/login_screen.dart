import 'package:datingapp/utility/common_color.dart';
import 'package:datingapp/utility/common_text.dart';
import 'package:datingapp/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_multi_formatter/widgets/country_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../utility/text_style.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PhoneCountryData? _initialCountryData;
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: MediaQuery.of(context).size.width / 5),
          Text(AppText.mobile, style: tsBlack22w600.copyWith(fontSize: 32)),
          SizedBox(height: 10),
          Text(AppText.verify, style: tsBlack14w400),
          SizedBox(height: 50),
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
                    decoration: const InputDecoration(border: InputBorder.none),
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
                    style: tsBlack14w400.copyWith(fontWeight: FontWeight.w500),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          _initialCountryData?.phoneMaskWithoutCountryCode,
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      PhoneInputFormatter(
                        allowEndlessPhone: false,
                        defaultCountryCode: _initialCountryData?.countryCode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              if (phone.text.isEmpty || phone.text == "") {
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
                Map<String, dynamic> params = {"phone": phone.text};
                // kAuthController.callLoginApi(params, () {
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
        ],
      ),
    );
  }
}
