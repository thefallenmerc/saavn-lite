import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/config/api_client.dart';
import 'package:mobile/config/config.dart';
import 'package:mobile/helpers/shared_preference.dart';
import 'package:mobile/services/http_service.dart';

void setUpDependencyManager(Config config) {
  final dependencyManager = GetIt.instance;

  // register helpers
  dependencyManager.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper());

  dependencyManager.registerSingleton<HttpService>(
    HttpService(
        APIClient(Dio(), logging: config.apiLogging),
        prefs: GetIt.instance<SharedPreferenceHelper>()
      )
    );

} 