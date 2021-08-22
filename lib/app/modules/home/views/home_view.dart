import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/controllers/controllers.dart';
import 'package:sample_project/controllers/user_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';
import '../controllers/home_controller.dart';
import 'package:sample_project/extensions.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => Center(
          child: Column(
            children: [
              Text(UserController.to.user.value?.displayName ?? ''),
              Text(ApiController.to.token.value?.refreshToken ?? ''),
              Text(ApiController.to.token.value?.accessToken ?? ''),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildSubscriptionOnUser() {
    final subscription = CurrentUserSubscription(
        variables:
            CurrentUserArguments(userId: controller.user.value?.id ?? ''));
    return Subscription(
        options: subscription.options() as SubscriptionOptions,
        builder: (result) {
          if (result.data != null) {
            final user = subscription.parse(result.data!).user;
            return Center(
              child: Column(
                children: [
                  Text(user?.displayName ?? ''),
                  Text(ApiController.to.token.value?.refreshToken ?? ''),
                  Text(ApiController.to.token.value?.accessToken ?? ''),
                ],
              ),
            );
          }
          return SizedBox();
        });
  }
}
