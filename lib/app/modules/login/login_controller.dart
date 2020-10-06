import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/request_token.dart';
import 'package:tmdb_get_pattern/app/data/resositories/local/local_auth_repository.dart';
import 'package:tmdb_get_pattern/app/data/resositories/remote/authentication_repository.dart';
import 'package:tmdb_get_pattern/app/routes/app_routes.dart';

class LoginController extends GetxController {

  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();

  final LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();

  String _username = '';
  String _password = '';
  RxBool _isLogging = false.obs;

  String get username => _username;

  String get password => _password;

  RxBool get isLogging => _isLogging;

  void onChangeUsername(String value) {
    this._username = value;
  }

  void onChangePassword(String value) {
    this._password = value;
  }

  void setLogging(bool value){
    this._isLogging.value = value;
  }

  Future<void> submit() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      RequestToken requestToken =
      await _authenticationRepository.newRequestToken();

      final RequestToken authRequestToken =
          await _authenticationRepository.validateWithLogin(
        username: this._username,
        password: this._password,
        requestToken: requestToken.requestToken,
      );

      await _localAuthRepository.setSession(authRequestToken);

      Get.offNamed(AppRoutes.HOME);

    } catch (e) {
      if (e is DioError) {
        String title = 'Error';
        String message = '';
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }

        print('Error from Dio $e');

        Get.dialog(CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Get.back(),
            ),
          ],
        ));
      } else {
        print('Error not from Dio ${e}');
      }
    }
  }
}
