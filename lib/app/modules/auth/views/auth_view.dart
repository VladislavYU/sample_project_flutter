import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_project/controllers/api_controller.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AuthView'),
          centerTitle: true,
        ),
        body: Container());
  }
}
