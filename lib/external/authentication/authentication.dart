import 'dart:convert';

import 'package:crypto/crypto.dart';

class Authentication {
  static Authentication instance = Authentication();

  final int _ts = 1;
  final String _publicKey = 'cb31ebf3bbfcf35cb8dcecd3d9d120b5';
  final String _privateKey = 'e3e14943436bce754eef42b8fcc8f164c62d4690';

  String getAuthentication() {
    var hash = md5.convert(utf8.encode("$_ts$_privateKey$_publicKey"));
    var queryParam = '?ts=$_ts&apikey=$_publicKey&hash=$hash';
    return queryParam;
  }
}
