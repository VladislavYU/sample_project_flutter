import 'package:sample_project/app/resources/app_theme.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/presentation/routes/app_pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(ApiController.client),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        theme: AppTheme.lightTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        locale: Get.deviceLocale,
      ),
    );
  }
}
