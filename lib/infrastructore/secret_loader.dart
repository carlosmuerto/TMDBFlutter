import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

part 'secret_loader.freezed.dart';
part 'secret_loader.g.dart';

@freezed
abstract class Secret with _$Secret {
  const factory Secret({
    @required @JsonKey(name: 'api_key') String apiKey,
    @required @JsonKey(name: 'base_url') String baseUrl,
  }) = _Secret;
  factory Secret.fromJson(Map<String, dynamic> json) => _$SecretFromJson(json);
}

class SecretLoader {
  static Future<Secret> get load {
    return rootBundle
        .loadString('assets/secrets.json')
        .then((jsonStr) => Secret.fromJson(json.decode(jsonStr)));
  }
}
