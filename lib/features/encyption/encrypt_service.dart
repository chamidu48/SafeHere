import 'package:encrypt/encrypt.dart';


class EncryptionService {
  final Encrypter _encrypter=Encrypter(AES(Key.fromLength(32)));
  final _iv = IV.fromLength(16);

  String decrypt(String? encryptedText) {
    final encrypted = Encrypted.fromBase64(encryptedText!);
    return _encrypter.decrypt(encrypted, iv: this._iv);
  }

  String encrypt(String? text) {
    return _encrypter.encrypt(text!, iv: _iv).base64;
  }

}