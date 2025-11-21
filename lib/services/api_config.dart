class ApiConfig {
  /// base url
  static const String serverUrl = "http://127.0.0.1:8000/api/";
  static const String baseUrl = "$serverUrl/";

  /// different images url
  static const String productImageUrl =
      "https://application.aonehub.com/storage/";

  /// authentication
  static const String login = "${baseUrl}login";
  static const String registration = "${baseUrl}register";
  static const String verifyOtp = "${baseUrl}verifyOtp";
  static const String resendOtp = "${baseUrl}resendOtp";

  /// home
  static const String allProduct = "${baseUrl}allproduct";
  static const String searchProduct = "${baseUrl}searchProducts";


  static const String methodPOST = "post";
  static const String methodGET = "get";
  static const String methodPUT = "put";
  static const String methodDELETE = "delete";

  static const String error = "Error";
  static const String success = "Success";
  static const String hasError = "HasError";
  static const String warning = "Warning";
}
