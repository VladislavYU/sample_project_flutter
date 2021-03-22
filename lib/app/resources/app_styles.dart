import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  static InputDecoration getInputDecoration({
    String hintText,
    String labelText,
    Widget suffixIcon,
  }) {
    return new InputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      labelText: labelText,
      counterText: '',
      hintStyle: Get.theme.textTheme.bodyText2.merge(
        TextStyle(color: Get.theme.focusColor),
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Get.theme.hintColor.withOpacity(0.2))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Get.theme.hintColor)),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: Get.theme.textTheme.bodyText2.merge(
        TextStyle(color: Get.theme.hintColor),
      ),
    );
  }
}
