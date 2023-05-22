import 'dart:ui';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class TokenManager {

  static final _storage = FlutterSecureStorage();

  static const _keyUserToken = 'token';


  static Future setUserToken(String usertoken) async =>
      await _storage.write(key: _keyUserToken, value: usertoken);


  static Future<String?> getUserToken() async =>
      await _storage.read(key: _keyUserToken);


}