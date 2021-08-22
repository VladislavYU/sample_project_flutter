import 'dart:async';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/controllers/user_controller.dart';
import 'package:sample_project/extensions.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

class HomeController extends GetxController {
  final UserController _userController;
  Rx<UserMixin> get user => _userController.user;

  HomeController(
    this._userController,
  );

  @override
  void onInit() async {
    super.onInit();
    while (true) {
      await Future.delayed(Duration(minutes: 1), () async {
        final mutation = UpdateUserMutation(
            variables: UpdateUserArguments(
                id: user.value.id, display_name: DateTime.now().toString()));
        await ApiController.client.mutate(mutation.options());
      });
    }
  }
}
