import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<User1Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UserView'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Obx(() {
              if (controller.isLoading.value) return _buildLoading();
              if (controller.isError.value) return _buildError();
              if (controller.currentUser.value == null)
                return _buildEmptyUser();
              return _buildUser();
            }),
          ),
        ));
  }

  Widget _buildError() {
    return Text('ERROR');
  }

  Widget _buildLoading() {
    return CircularProgressIndicator();
  }

  Widget _buildEmptyUser() {
    return Text('User is Empty');
  }

  Widget _buildUser() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('User name: ${controller.currentUser.value?.firstName}'),
        Text('User phone: ${controller.currentUser.value?.phone}')
      ],
    );
  }
}
