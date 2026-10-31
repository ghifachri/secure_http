import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  static const String _tokenKey = 'auth_token';
  static const String _pinKey = 'user_pin';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    print('Token berhasil disimpan');
  }

  Future<String?> getToken() async {
    final token = await _storage.read(key: _tokenKey);
    print(token != null ? 'Token ditemukan' : 'Token tidak ditemukan');
    return token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    print('Token berhasil dihapus');
  }

  Future<void> savePin(String pin) async {
    await _storage.write(key: _pinKey, value: pin); 
    print('PIN berhasil disimpan');
  }

  // Membaca PIN
  Future<String?> getPin() async {
    return await _storage.read(key: _pinKey);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
    print('Semua data berhasil dihapus');
  }

  Future<bool> hasToken() async {
    return await _storage.containsKey(key: _tokenKey);
  }
}