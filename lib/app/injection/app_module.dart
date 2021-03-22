import 'package:sample_project/app/base/build_mode.dart';
import 'package:sample_project/app/base/theme_controller.dart';
import 'package:sample_project/controllers/controllers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

BuildMode kBuildMode;

Future<void> initAppModule(BuildMode buildMode) async {
  kBuildMode = buildMode;

  await initializeDateFormatting();
  await DotEnv().load();
  final env = DotEnv().env;

  await GetStorage.init();
  Get.put(ThemeController());


  await Get.put(StoreController()).init();

  final graphqlEndpoint = env['GRAPHQL_ENDPOINT'];
  final graphqlWsEndpoint = env['GRAPHQL_WS_ENDPOINT'];
  final apiBaseUrl = env['API_BASE_URL'];
  final storageBaseUrl = env['STORAGE_BASE_URL'];
  Get.put(ApiController(
    graphqlEndpoint: graphqlEndpoint,
    graphqlWsEndpoint: graphqlWsEndpoint,
    apiBaseUrl: apiBaseUrl,
    storageBaseUrl: storageBaseUrl,
  ));
  await Get.put(UserController()).init();
}