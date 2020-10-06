import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/request_token.dart';
import 'package:tmdb_get_pattern/app/data/providers/local/local_auth_provider.dart';

class LocalAuthRepository {

  final LocalAuthProvider _localAuthProvider = Get.find<LocalAuthProvider>();

  Future<void> setSession(RequestToken requestToken) => _localAuthProvider.setSession(requestToken);

  Future<void> clearSession() => _localAuthProvider.clearSession();

  Future<RequestToken> get session => _localAuthProvider.getSession();

}
