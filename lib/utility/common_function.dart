import '../main.dart';
import 'common_text.dart';
import 'constant.dart';
import 'package:get/get.dart';

bool isNotEmptyString(String? data) {
  return data != null && data.isNotEmpty;
}

emailValidation(value) {
  return value.toString().isEmpty
      ? AppText.notEmptyFieldMessage
      : !GetUtils.isEmail(value)
      ? AppText.validEmail
      : null;
}

void setIsLogin({required bool isLogin}) {
  getStorage.write(PrefConstants.isLogin, isLogin);
}

bool getIsLogin() {
  print("isLogin --> ${getStorage.read(PrefConstants.isLogin)}");
  return (getStorage.read(PrefConstants.isLogin) ?? false);
}
