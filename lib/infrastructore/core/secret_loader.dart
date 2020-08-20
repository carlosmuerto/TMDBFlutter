import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

import 'secret.dart';

@singleton
class SecretLoader {
  static final SecretLoader _singleton = SecretLoader._internal();
  factory SecretLoader() => _singleton;
  SecretLoader._internal();
  static SecretLoader get shared => _singleton;

  Secret get secret {
    if (_secret == null) throw "Singleton not initialized";
    return _secret;
  }

  Future<void> init() async {
    if (_secret == null) {
      _secret = await rootBundle
          .loadString('assets/secrets.json')
          .then((jsonStr) => Secret.fromJson(json.decode(jsonStr)));
    }
    return null;
  }

  Secret _secret;
}
