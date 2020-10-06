import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/request_token.dart';
import 'package:tmdb_get_pattern/app/data/providers/remote/authentication_provider.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationRepository {
  final AuthenticationProvider _api = Get.find<AuthenticationProvider>();

  Future<RequestToken> newRequestToken() => _api.newRequestToken();

  Future<RequestToken> validateWithLogin({
    @required String username,
    @required String password,
    @required String requestToken,
  }) =>
      _api.validateWithLogin(
        username: username,
        password: password,
        requestToken: requestToken,
      );
}
