import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

void showSnackbar(String text) {
  Get.rawSnackbar(
    message: text,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.all(8),
    borderRadius: 16,
    backgroundColor: Colors.black
  );
}
