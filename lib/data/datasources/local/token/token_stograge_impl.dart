import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';

@LazySingleton(as: TokenStorage)
class TokenStorageImpl extends TokenStorage{
  static const _accessToken = 'access_token';
  static const _refreshToken = 'refresh_token';

  final FlutterSecureStorage _stograge;

  TokenStorageImpl(this._stograge);
  @override
  Future<String?> getAccessToken() {
    return _stograge.read(key: _accessToken);
  }
  @override
  Future<String?> getRefreshToken() {
    return _stograge.read(key: _refreshToken);
  }
  @override
  Future<void> saveAccessToken(String token) {
    return _stograge.write(key: _accessToken, value: token);
  }
  @override
  Future<void> saveRefreshToken(String token) {
    return _stograge.write(key: _refreshToken, value: token);
  }
  @override
  Future<void> clear() {
    return _stograge.deleteAll();
  }
}