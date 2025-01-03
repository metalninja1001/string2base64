import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print('''
#########################################################
                      S2B64
A dart program used to convert an ascii string to base64
#########################################################
''');
  stdout.write("""
#########################################################
Enter the string you would like to encrypt and decrypt: """);
  //print('Enter the string you would like to encrypt and decrypt');
  var inputString;
  inputString = inputString ?? stdin.readLineSync();
  //String? inputString = stdin.readLineSync();
  final string = '$inputString'; // 'YOUR-STRING'
  stdout.write("""
#########################################################
Enter the key you would like to use to encrypt and decrypt the string: """);
  var inputKey;
  inputKey = inputKey ?? stdin.readLineSync();
  //print('Enter the key you would like to use to encrypt and decrypt the string');
  //String? inputKey = stdin.readLineSync();
  final key = '$inputKey'; // Replace with a secure key

  final enString = encryptAES(string, key);

  final deString = decryptAES(enString, key);

  print('''
########################################################
Original String: $string
Encrypted String : $enString
Decrypted String: $deString
########################################################''');
  //print('Encrypted String: $enString');
  //print('Decrypted String: $deString');
}

String encryptAES(String data, String key) {
  final encryptedBytes = utf8.encode(data).map((byte) => byte ^ key.codeUnitAt(0)).toList();
  return base64.encode(encryptedBytes);
}

String decryptAES(String encryptedData, String key) {
  final encryptedBytes = base64.decode(encryptedData);
  final decryptedBytes = encryptedBytes.map((byte) => byte ^ key.codeUnitAt(0)).toList();
  return utf8.decode(decryptedBytes);
}
