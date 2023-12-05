import 'package:as_toast_x/animations.dart';
import 'package:flutter/material.dart';
import 'package:as_toast_x/as_toast_x.dart';
import 'package:as_toast_x/utils.dart';

class ToastHandler {
  static void showSuccessToast(BuildContext context, String message) {
    asToastX(
      context,
      child: Text(
        message,
        style: asTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          size: 16,
        ),
      ),
      toastType: ToastType.success,
      toastDirection: ToastDirection.ltr,
      iconType: IconType.material,
    );
  }

  static void showErrorToast(BuildContext context, String message) {
    asToastX(
      context,
      child: Text(
        message,
        style: asTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          size: 16,
        ),
      ),
      toastType: ToastType.error,
    );
  }
}
