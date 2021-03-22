import 'package:sample_project/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'routes/app_pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(ApiController.client),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
        locale: Get.deviceLocale,
      ),
    );
  }
}
