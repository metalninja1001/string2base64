import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() {
  final string = 'YOUR-STRING';
  final key = 'my_secret_key'; // Replace with a secure key

  final enString = encryptAES(string, key);

  final deString = decryptAES(enString, key);

  print('Original URL: $string');
  print('Encrypted URL: $enString');
  print('Decrypted URL: $deString');
}

String encryptAES(String data, String key) {
  final encryptedBytes = utf8.encode(data).map((byte) => byte ^ key.codeUnitAt(0)).toList();
  return base64.encode(encryptedBytes);
}

String decryptAES(String encryptedData, String key) {
  // Use a proper decryption algorithm (e.g., AES)
  final encryptedBytes = base64.decode(encryptedData);
  final decryptedBytes = encryptedBytes.map((byte) => byte ^ key.codeUnitAt(0)).toList();
  return utf8.decode(decryptedBytes);
}