import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomModal {
  static void showSuccess(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  static void showInfo(BuildContext context, String message,
      {displayDuration = const Duration(milliseconds: 3000),
      snackBarPosition = SnackBarPosition.top}) {
    showTopSnackBar(
      Overlay.of(context),
      displayDuration: displayDuration,
      snackBarPosition: snackBarPosition,
      CustomSnackBar.info(
        message: message,
        backgroundColor: Colors.yellow.shade800,
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        backgroundColor: Colors.red.shade700,
      ),
    );
  }
}
