import 'package:sample_project/app/base/build_mode.dart';
import 'package:sample_project/app/base/theme_controller.dart';
import 'package:sample_project/controllers/controllers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/data/repository/user_data_repository.dart';
import 'package:sample_project/data/service/user_service.dart';
import 'package:sample_project/domain/repository/user_repository.dart';

late BuildMode kBuildMode;

Future<void> initAppModule(BuildMode buildMode) async {
  kBuildMode = buildMode;

  await dotenv.load(fileName: ".env");
  final env = dotenv.env;

  await GetStorage.init();
  Get.put(ThemeController());

  await Get.put(StoreController()).init();

  final graphqlEndpoint = env['GRAPHQL_ENDPOINT'];
  final graphqlWsEndpoint = env['GRAPHQL_WS_ENDPOINT'];
  final apiBaseUrl = env['API_BASE_URL'];
  final storageBaseUrl = env['STORAGE_BASE_URL'];
  await Get.put(ApiController(
    graphqlEndpoint: graphqlEndpoint,
    graphqlWsEndpoint: graphqlWsEndpoint,
    apiBaseUrl: apiBaseUrl,
    storageBaseUrl: storageBaseUrl,
  )).init();
  await Get.put(UserController()).init();

  injectServices();
  injectRepositories();
}

void injectServices() {
  Get..put(UserService());
}

void injectRepositories() {
  Get..put<UserRepository>(UserDataRepository(Get.find()));
}
