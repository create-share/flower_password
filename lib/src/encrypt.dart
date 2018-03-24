import 'dart:convert';
import 'package:crypto/crypto.dart';

String _hmacMd5(String key, String string) {
  var encodedKey = UTF8.encode(key);
  var encodedString = UTF8.encode(string);
  var digest = (new Hmac(md5, encodedKey)).convert(encodedString);
  return digest.toString();
}

class FlowerPassword {
  static String encrypt(String password, String key) {
    var md5One = _hmacMd5(key, password);
    var md5Two = _hmacMd5('snow', md5One);
    var md5Three = _hmacMd5('kise', md5One);

    var intRe = new RegExp(r'\d');
    var rule = md5Three.split('');
    var source = md5Two.split('');

    var str = 'sunlovesnow1990090127xykab';
    for (var i = 0; i <= 31; i++) {
      if (!intRe.hasMatch(source[i]) && str.indexOf(rule[i]) > -1) {
        source[i] = source[i].toUpperCase();
      }
    }
    var code32 = source.join('');
    if (intRe.hasMatch(code32[0])) {
      return 'K' + code32.substring(1, 16);
    } else {
      return code32.substring(0, 16);
    }
  }
}
