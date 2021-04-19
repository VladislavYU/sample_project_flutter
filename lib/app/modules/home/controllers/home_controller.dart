import 'dart:async';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/controllers/user_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';
import 'package:sample_project/extensions.dart';

class HomeController extends GetxController {
  Rx<UserMixin> get user => UserController.to.user;
  var title = ''.obs;
  var content = ''.obs;
  Future<QueryResult> sendNews() {
    return ApiController.mutate(CreateNewsMutation(
      variables: CreateNewsArguments(
          content: content.value +
              'splitterDisplayName' +
              user.value.displayName.toString(),
          title: title.value),
    ).options());
  }

  void clearFields() {
    title.value = '';
    content.value = '';
  }

  final newsSubs = NewsListSubscription(
    variables: NewsListArguments(
      orderBy: [
        NewsOrderBy(createdAt: OrderBy.desc),
      ],
    ),
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
