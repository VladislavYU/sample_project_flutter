import 'package:sample_project/app/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeData get _light => AppTheme.lightTheme;
  static ThemeData get _dark => AppTheme.darkTheme;

  final _isDarkStorage = true.val('isLight');
  final isDark = false.obs;

  ThemeController() {
    isDark.value = _isDarkStorage.val;
  }

  void switchTheme() {
    _isDarkStorage.val = !_isDarkStorage.val;
    isDark.value = _isDarkStorage.val;
    Get.changeTheme(_isDarkStorage.val ? _light : _dark);
  }

  ThemeData currentTheme() => _isDarkStorage.val ? _light : _dark;
}
