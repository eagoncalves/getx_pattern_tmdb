import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/request_token.dart';
import 'package:tmdb_get_pattern/app/data/resositories/local/local_auth_repository.dart';
import 'package:tmdb_get_pattern/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    this._init();
  }

  _init() async {
    try {
      final RequestToken _requestToken = await _localAuthRepository.session;

      if (_requestToken != null) {
        Get.offNamed(AppRoutes.HOME);
      } else {
        Get.offNamed(AppRoutes.LOGIN);
      }
    } catch (e) {
      print('Error OnInit $e ');
    }
  }
}
