import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

abstract class BiometricGate {
  Future<bool> get isSupported;
  Future<bool> get isAppLockEnabled;
  Future<void> setAppLockEnabled(bool enabled);
  Future<bool> authenticate({String reason});
}

class LocalBiometricGate implements BiometricGate {
  LocalBiometricGate({LocalAuthentication? auth, FlutterSecureStorage? storage})
    : _auth = auth ?? LocalAuthentication(),
      _storage =
          storage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock_this_device,
            ),
          );

  final LocalAuthentication _auth;
  final FlutterSecureStorage _storage;
  static const _lockKey = 'app_lock_enabled';

  @override
  Future<bool> get isSupported async {
    try {
      return await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<bool> get isAppLockEnabled async {
    final value = await _storage.read(key: _lockKey);
    return value == 'true';
  }

  @override
  Future<void> setAppLockEnabled(bool enabled) async {
    await _storage.write(key: _lockKey, value: enabled ? 'true' : 'false');
  }

  @override
  Future<bool> authenticate({
    String reason = 'Unlock Transition Journal',
  }) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );
    } on PlatformException {
      return false;
    }
  }
}
