import 'dart:async';
import 'package:datingapp/utility/common_text.dart';
import 'package:datingapp/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';
import '../../home/view/about_me_screen.dart';
import '../../home/view/bottom_navigation_screen.dart';

class OtpScreen extends StatefulWidget {
  String? number;

  OtpScreen({super.key, this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  Color _color = colorPrimary.withOpacity(0.5);
  Color _color1 = colorPrimary.withOpacity(0.5);
  Color _color2 = colorPrimary.withOpacity(0.5);
  Color _color3 = colorPrimary.withOpacity(0.5);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Timer? timer;
  int counter = 59;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _color = Colors.white;
        });
      } else {
        setState(() {
          _color = colorPrimary.withOpacity(0.5);
        });
      }
    });
    _focusNode1.addListener(() {
      if (_focusNode1.hasFocus) {
        setState(() {
          _color1 = Colors.white;
        });
      } else {
        setState(() {
          _color1 = colorPrimary.withOpacity(0.5);
        });
      }
    });
    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        setState(() {
          _color2 = Colors.white;
        });
      } else {
        setState(() {
          _color2 = colorPrimary.withOpacity(0.5);
        });
      }
    });
    _focusNode3.addListener(() {
      if (_focusNode3.hasFocus) {
        setState(() {
          _color3 = Colors.white;
        });
      } else {
        setState(() {
          _color3 = colorPrimary.withOpacity(0.5);
        });
      }
    });
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: MediaQuery.of(context).size.width / 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              counter > 9
                  ? Text("00 : $counter", style: tsBlack24w600)
                  : Text("00 : 0$counter", style: tsBlack24w600),
              SizedBox(height: 10),
              Text(
                AppText.type,
                style: tsBlack16w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Form(
                key: formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: code1,
                          style: tsBlack16w500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: colorPurple),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: colorPurple),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            fillColor: _color,
                          ),
                          onFieldSubmitted: (value) {
                            _focusNode.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode1);
                          },
                          onChanged: (value) {
                            _focusNode.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode1);
                          },
                          autofocus: false,
                          focusNode: _focusNode,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: code2,
                          style: tsBlack16w500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: colorPurple),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            fillColor: _color1,
                          ),
                          onFieldSubmitted: (value) {
                            _focusNode1.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode2);
                          },
                          onChanged: (value) {
                            _focusNode1.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode2);
                          },
                          autofocus: false,
                          focusNode: _focusNode1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: code3,
                          style: tsBlack16w500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: colorPurple),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            fillColor: _color2,
                          ),
                          onFieldSubmitted: (value) {
                            _focusNode2.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode3);
                          },
                          onChanged: (value) {
                            _focusNode2.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode3);
                          },
                          autofocus: false,
                          focusNode: _focusNode2,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: code4,
                          style: tsBlack16w500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: colorPurple),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            fillColor: _color3,
                          ),
                          onFieldSubmitted: (value) {
                            print("code send done ----->1");
                            _focusNode3.unfocus();
                          },
                          onChanged: (value) {
                            print("code send done ----->2");

                            _focusNode3.unfocus();
                          },
                          autofocus: false,
                          focusNode: _focusNode3,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ).paddingOnly(left: 10, right: 10, bottom: 60),
              numPad(),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Map<String, dynamic> params = {'phone': widget.number};
                  // kAuthController.resendOtp(params, () {});
                },
                child: Text(
                  AppText.again,
                  style: tsBlack16w500.copyWith(color: colorPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addDigit(String digit) {
    setState(() {
      if (code1.text.isEmpty) {
        code1.text = digit;
        FocusScope.of(context).requestFocus(_focusNode1);
      } else if (code2.text.isEmpty) {
        code2.text = digit;
        FocusScope.of(context).requestFocus(_focusNode2);
      } else if (code3.text.isEmpty) {
        code3.text = digit;
        FocusScope.of(context).requestFocus(_focusNode3);
      } else if (code4.text.isEmpty) {
        code4.text = digit;
        print("code add done ---->");
        Map<String, dynamic> params = {
          "phone": widget.number,
          "otp":
              code1.value.text +
              code2.value.text +
              code3.value.text +
              code4.value.text,
        };
        // kAuthController.verifyOtp(params, () {
        // Get.to(() => BottomNavigationScreen());
        Get.to(() => AboutMeScreen());
        // });
        _focusNode3.unfocus();
      }
    });
  }

  void backspace() {
    setState(() {
      if (code4.text.isNotEmpty) {
        code4.clear();
        FocusScope.of(context).requestFocus(_focusNode3);
      } else if (code3.text.isNotEmpty) {
        code3.clear();
        FocusScope.of(context).requestFocus(_focusNode2);
      } else if (code2.text.isNotEmpty) {
        code2.clear();
        FocusScope.of(context).requestFocus(_focusNode1);
      } else if (code1.text.isNotEmpty) {
        code1.clear();
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
  }

  Widget numKey(String number) {
    return GestureDetector(
      onTap: () => addDigit(number),
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
        child: Text(
          number,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget backKey() {
    return GestureDetector(
      onTap: backspace,
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
        child: const Icon(Icons.backspace, size: 28),
      ),
    );
  }

  Widget numPad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [numKey("1"), numKey("2"), numKey("3")],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [numKey("4"), numKey("5"), numKey("6")],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [numKey("7"), numKey("8"), numKey("9")],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [const SizedBox(width: 70), numKey("0"), backKey()],
        ),
      ],
    );
  }
}
