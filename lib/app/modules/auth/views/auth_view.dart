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
              child: Obx(
                () => Column(
                  children: [
                    _sign(
                        Colors.blue[100],
                        "SignUp",
                        () => controller.reg(),
                        "Зарегистрироваться",
                        controller.signIn.value,
                        () => controller.switchSign()),
                    _sign(
                        Colors.green[100],
                        "SignIn",
                        () => controller.login(),
                        "Войти в аккаунт",
                        !controller.signIn.value,
                        () => controller.switchSign())
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _sign(color, buttontext, myFunc, title, isSignin, showSign) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: color,
        child: Column(
          children: [
            InkWell(
                onTap: !isSignin ? showSign : () {},
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title),
                    ),
                  ],
                )),
            Visibility(
              visible: isSignin,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: "email"),
                        onChanged: (value) => controller.email.value = value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(hintText: "password"),
                        obscureText: true,
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
            )
          ],
        ),
      ),
    );
  }
}
