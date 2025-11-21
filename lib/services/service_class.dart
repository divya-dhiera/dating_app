import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get_core/get_core.dart';

import '../main.dart';
import '../modual/authentication/view/login_screen.dart';
import '../modual/home/view/splash_screen.dart';
import '../utility/api_utility.dart';
import '../utility/common_function.dart';
import '../utility/common_text.dart';
import '../utility/common_widgets.dart';
import '../utility/constant.dart';
import 'api_config.dart';
import 'boolean_response_model.dart';

const String somethingWrong = "Something Went Wrong";
const String responseMessage = "NO RESPONSE DATA FOUND";
const String interNetMessage =
    "No internet connection, Please check your internet connection and try again later";
const String connectionTimeOutMessage =
    "Oops.. Server not working or might be in maintenance. Please Try Again Later";
const String authenticationMessage =
    "The session has been Expired. Please log in again.";
const String tryAgain = "Try Again";
const String logInAgain = "LogIn Again";
const String createNewAccount = "Create new Account";

///Status Code with message type array or string
class Api {
  Future serviceCall({
    required Map<String, dynamic> params,
    Map<String, dynamic>? headers,
    required String serviceUrl,
    required Function success,
    required Function error,
    required bool isProgressShow,
    required String methodType,
    String? deviceType,
    bool isFromLogout = false,
    bool? isLoading,
    bool? isHideLoader = true,
    FormData? formValues,
  }) async {
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialog();
      }
      if (formValues != null) {
        Map<String, dynamic> tempMap = <String, dynamic>{};
        for (var element in formValues.fields) {
          tempMap[element.key] = element.value;
        }
        FormData reGenerateFormData = FormData.fromMap(tempMap);
        for (var element in formValues.files) {
          reGenerateFormData.files.add(MapEntry(element.key, element.value));
        }
        formValues = reGenerateFormData;
      }
      Map<String, dynamic> headerParameters;
      headerParameters = {
        'Authorization': 'Bearer ${getStorage.read(PrefConstants.authToken)}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      Response response;
      if (methodType == ApiConfig.methodGET) {
        response = await APIProvider.getDio().get(
          serviceUrl,
          queryParameters: params,
          options: Options(headers: headers ?? headerParameters),
        );
      } else if (methodType == ApiConfig.methodPUT) {
        response = await APIProvider.getDio().put(
          serviceUrl,
          data: params,
          options: Options(headers: headers ?? headerParameters),
        );
      } else if (methodType == ApiConfig.methodDELETE) {
        response = await APIProvider.getDio().delete(
          serviceUrl,
          data: params,
          options: Options(headers: headers ?? headerParameters),
        );
      } else {
        response = await APIProvider.getDio().post(
          serviceUrl,
          data: formValues ?? params,
          options: Options(headers: headers ?? headerParameters),
        );
      }

      if (kDebugMode) {
        logPrint("serviceUrl ===> $serviceUrl");
        logPrint("params ===> $params");
        logPrint("status code ===> ${response.statusCode}");
        logPrint("response ===> $response");
      }
      if (handleResponse(response) && response.statusCode == 200 ||
          response.statusCode == 201) {
        // ///postman response Code
        // BooleanResponseModel? responseData = BooleanResponseModel.fromJson(({
        //   "StatusCode": 200,
        //   "HasError": false,
        //   "Message": "",
        //   "data": (response.data),
        // }));
        if (isHideLoader ?? true) {
          hideProgressDialog();
        }
        if (response.data['status'] == true ||
            response.data['status'] == 'success') {
          success((response.data));
        } else {
          if (response.data['force_logout'] == 1) {
            Get.to(() => const LoginScreen());
          } else {
            error(response.data);
          }
        }
      } else if (response.statusCode == 203) {
        BooleanResponseModel? responseData = BooleanResponseModel.fromJson(
          jsonDecode(response.data),
        );
        if (isHideLoader ?? true) {
          hideProgressDialog();
        }
        handleAuthentication(
          boolResponse: responseData,
          isFromLogOut: isFromLogout,
        );
      } else if (response.statusCode == 204) {
        if (isHideLoader ?? true) {
          hideProgressDialog();
        }
      } else if (response.statusCode == 401) {
        Get.offAll(() => LoginScreen());
        getStorage.erase();
      } else {
        try {
          BooleanResponseModel? responseData = BooleanResponseModel.fromJson(
            jsonDecode(response.data),
          );
          if (isHideLoader ?? true) {
            hideProgressDialog();
          }
          if (response.statusCode != 400 && response.statusCode != 200) {
          } else if (!((responseData.HasError ?? false)) &&
              isNotEmptyString(responseData.Message)) {
            logPrint(responseData.Message ?? '');
            showSnackBar(
              title: ApiConfig.error,
              message: responseData.Message ?? "Please Try Again",
            );
          }
          error(response);
        } catch (e) {
          if (isHideLoader ?? true) {
            hideProgressDialog();
          }
        }
      }
    } else {
      showErrorMessage(
        message: interNetMessage,
        callBack: () {
          get_x.Get.back();
          serviceCall(
            params: params,
            serviceUrl: serviceUrl,
            success: success,
            error: error,
            isProgressShow: isProgressShow,
            methodType: methodType,
            formValues: formValues,
            isFromLogout: isFromLogout,
            isHideLoader: isHideLoader,
            isLoading: isLoading,
            headers: headers,
          );
        },
      );
    }
  }
}

void logPrint(dynamic logPrint) {
  if (kDebugMode) {
    // ignore: avoid_print
    print('${logPrint ?? ""}');
  }
}

void handleAuthentication({
  required BooleanResponseModel boolResponse,
  bool isFromLogOut = false,
}) {
  if (!isFromLogOut) {
    apiAlertDialog(
      buttonTitle: logInAgain,
      message: boolResponse.Message ?? authenticationMessage,
      isShowGoBack: false,
      buttonCallBack: () {
        get_x.Get.offAll(() => const SplashScreen());
      },
    );
  } else {
    // clearPref();
    get_x.Get.offAll(() => const SplashScreen());
  }
}

int serviceCallCount = 0;

showErrorMessage({required String message, Function? callBack}) {
  serviceCallCount = 0;
  hideProgressDialog();
  apiAlertDialog(
    buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
    message: message,
    buttonCallBack: () {
      if (callBack != null) {
        callBack();
      } else {
        get_x.Get.back(); // For redirecting to back screen
      }
    },
  );
}

void showProgressDialog({bool isLoading = true}) {
  isLoading = true;

  get_x.Get.dialog(
    WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(
        color: Colors.black.withOpacity(0.1),
        child: const SpinKitFadingCircle(color: Colors.orange, size: 50),
      ),
    ),
    barrierDismissible: false,
  );
}

void hideProgressDialog({
  bool isLoading = true,
  bool isProgressShow = true,
  bool isHideLoader = true,
}) {
  if ((isProgressShow || isHideLoader) && (get_x.Get.isDialogOpen ?? true)) {
    // getX.Get.back();
    get_x.Get.back();
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  }
  return false;
}

bool handleResponse(Response response) {
  try {
    if (isNotEmptyString(response.toString())) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

apiAlertDialog({
  required String message,
  String? buttonTitle,
  Function? buttonCallBack,
  bool isShowGoBack = true,
}) {
  if (get_x.Get.isDialogOpen ?? false) {
    get_x.Get.back();
  }
  if (!(get_x.Get.isDialogOpen ?? false)) {
    get_x.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return isShowGoBack ? Future.value(true) : Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: const Text(AppText.appName),
          content: Column(
            children: [
              const Text("No Internet"),
              Text(message),
              const SizedBox(height: 10),
            ],
          ),
          actions: isShowGoBack
              ? [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(
                      isNotEmptyString(buttonTitle)
                          ? buttonTitle ?? 'Try again'
                          : "Try again",
                    ),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        get_x.Get.back();
                      }
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Go Back"),
                    onPressed: () {
                      get_x.Get.back();
                    },
                  ),
                ]
              : [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(
                      isNotEmptyString(buttonTitle)
                          ? buttonTitle ?? 'Try again'
                          : "Try again",
                    ),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        get_x.Get.back();
                      }
                    },
                  ),
                ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

showSuccessMessage({String? message, bool show = true}) {
  if (show) {
    return showSnackBar(
      title: ApiConfig.success,
      message: message ?? "Success",
    );
  }
}
