import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/providers/local/local_auth_provider.dart';
import 'package:tmdb_get_pattern/app/data/providers/remote/authentication_provider.dart';
import 'package:tmdb_get_pattern/app/data/providers/remote/movie_provider.dart';
import 'package:tmdb_get_pattern/app/data/resositories/local/local_auth_repository.dart';
import 'package:tmdb_get_pattern/app/data/resositories/remote/authentication_repository.dart';
import 'package:tmdb_get_pattern/app/data/resositories/remote/movie_repository.dart';

import 'constants.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);
    Get.lazyPut<Dio>(() => Dio(BaseOptions(baseUrl: Constants.BASE_URL)), fenix: true);

    Get.lazyPut<AuthenticationProvider>(() => AuthenticationProvider(), fenix: true);
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository(), fenix: true);

    Get.lazyPut<LocalAuthProvider>(() => LocalAuthProvider(), fenix: true);
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);

    Get.lazyPut<MovieRepository>(() => MovieRepository(), fenix: true);
    Get.lazyPut<MovieProvider>(() => MovieProvider(), fenix: true);
  }
}
