import 'package:get/get.dart';

import '../../../main.dart';
import '../../../services/api_config.dart';
import '../../../services/service_class.dart';
import '../../../utility/common_function.dart';
import '../../../utility/common_widgets.dart';
import '../../../utility/constant.dart';
import '../model/login_model.dart';

class AuthController extends GetxController {
  /// login api

  Rx<LoginDataModel> loginDataModel = LoginDataModel().obs;

  void callLoginApi(Map<String, dynamic> params, Function() callBack) {
    Api().serviceCall(
      params: params,
      serviceUrl: ApiConfig.login,
      success: (response) {
        print("login ---->${response}");
        loginDataModel.value = LoginDataModel.fromJson(response);
        getStorage.write(PrefConstants.userDetails, response);
        print("userToken ---->${loginDataModel.value.user?.authToken}");
        bool isLogin = true;
        getStorage.write(PrefConstants.isLogin, isLogin);
        logPrint("isLogin --> ${getStorage.read(PrefConstants.isLogin)}");
        getStorage.write(
          PrefConstants.authToken,
          loginDataModel.value.user?.authToken,
        );
        setIsLogin(isLogin: true);
        callBack();
      },
      error: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.error);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  ///Registration api

  void registrationApi(Map<String, dynamic> params, Function() callback) {
    Api().serviceCall(
      params: params,
      serviceUrl: ApiConfig.registration,
      success: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.success);
        callback();
      },
      error: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.error);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  /// Verify Otp Api

  void verifyOtp(Map<String, dynamic> params, Function() callback) {
    Api().serviceCall(
      params: params,
      serviceUrl: ApiConfig.verifyOtp,
      success: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.success);
        callback();
      },
      error: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.error);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  /// Resend Otp Api

  void resendOtp(Map<String, dynamic> params, Function() callback) {
    Api().serviceCall(
      params: params,
      serviceUrl: ApiConfig.resendOtp,
      success: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.success);
        callback();
      },
      error: (response) {
        showSnackBar(message: response["message"], title: ApiConfig.error);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }
}
