import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserInformation {
  final String accessToken;
  static const _storage = FlutterSecureStorage();

  UserToken({required this.accessToken});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    final userToken = UserInformation(accessToken: json['access_token']);
    _storage.write(key: 'ACCESS_TOKEN', value: userInfo.accessToken);
    return userToken;
  }

  static Future<String?> getToken() async => await _storage.read(key: 'ACCESS_TOKEN');
  static Future<void> deleteToken() async => await _storage.delete(key: 'ACCESS_TOKEN');
}