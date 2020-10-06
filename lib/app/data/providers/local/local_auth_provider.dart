import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/request_token.dart';

class LocalAuthProvider {
  static const KEY = 'session';
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(RequestToken requestToken) async {
    _storage.write(key: KEY, value: jsonEncode(requestToken.toJson()));
  }

  Future<void> clearSession() async {
    _storage.delete(key: KEY);
  }

  Future<RequestToken> getSession() async {
    final String _data = await _storage.read(key: KEY);

    if (_data == null) {
      return null;
    }

    final RequestToken _requestToken = RequestToken.fromJson(jsonDecode(_data));

    if (DateTime.now().isBefore(_requestToken.expiresAt)) {
      return _requestToken;
    }

    return null;
  }
}
