import 'dart:async';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/controllers/user_controller.dart';
import 'package:sample_project/extensions.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

class HomeController extends GetxController {
  final UserController _userController;
  Rxn<UserMixin> get user => _userController.user;

  HomeController(
    this._userController,
  );

  @override
  void onInit() async {
    super.onInit();
    while (true) {
      await Future.delayed(Duration(seconds: 30), () async {
        final mutation = UpdateUserMutation(
            variables: UpdateUserArguments(
                id: user.value?.id ?? '',
                display_name: DateTime.now().toString()));
        await ApiController.client
            .mutate(mutation.options() as MutationOptions);
      });
    }
  }
}
