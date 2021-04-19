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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _sign(Colors.blue[100], "SignUp", () => controller.reg(),
                    "Зарегистрироваться"),
                _sign(Colors.green[100], "SignIn", () => controller.login(),
                    "Войти в аккаунт")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sign(color, buttontext, myFunc, title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: color,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  onChanged: (value) => controller.email.value = value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  onChanged: (value) => controller.password.value = value,
                ),
              ),
            ),
            Container(
              child: TextButton(
                child: Text(buttontext),
                onPressed: () {
                  myFunc();
                  FocusManager.instance.primaryFocus.unfocus();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
