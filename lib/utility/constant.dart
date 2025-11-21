import 'package:get/get.dart';

import '../modual/authentication/controller/auth_controller.dart';
import '../modual/home/controller/home_controller.dart';


AuthController kAuthController = Get.put(AuthController());
HomeController kHomeController = Get.put(HomeController());

class PrefConstants {
  static const String isLogin = "isLogin";
  static const String authToken = "authToken";
  static const String userDetails = "userDetails";
}