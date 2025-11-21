import 'dart:async';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import '../services/api_config.dart';
import '../services/my_snackbar.dart' as my_snack_bar;
import 'common_text.dart';

showSnackBar({
  String title = AppText.appName,
  required String message,
  Color? color,
  int? duration,
}) {
  return my_snack_bar.snackbar(
    title,
    // title
    message,
    // message
    backgroundColor:
        color ??
        (title.isEmpty || title == ApiConfig.warning
            ? const Color(0xffFFCC00)
            : title == ApiConfig.success || title == AppText.appName
            ? Colors.green
            : Colors.red),
    icon: Icon(
      title.isEmpty || title == ApiConfig.warning
          ? Icons.warning_amber_outlined
          : title == ApiConfig.success
          ? Icons.check_circle
          : Icons.error,
      color:
          title.isEmpty || title == ApiConfig.warning
              ? Colors.black
              : Colors.white,
    ),
    onTap: (_) {},
    colorText:
        (title.isEmpty || title == ApiConfig.warning
            ? Colors.black
            : title == ApiConfig.success || title == AppText.appName
            ? Colors.white
            : Colors.white),
    snackPosition: my_snack_bar.SnackPosition.bottomCenter,
    shouldIconPulse: true,
    barBlur: 10,
    margin: EdgeInsets.zero,
    isDismissible: true,
    borderRadius: 0.0,
    duration: Duration(seconds: duration ?? (message.length > 20 ? 2 : 1)),
  );
}

///Common maskFormatter

MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
  mask: '##########',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

/// search time api calling delay

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
