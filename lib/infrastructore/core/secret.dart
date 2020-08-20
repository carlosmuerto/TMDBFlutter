import 'package:freezed_annotation/freezed_annotation.dart';

part 'secret.freezed.dart';
part 'secret.g.dart';

@freezed
abstract class Secret with _$Secret {
  const factory Secret({
    @required @JsonKey(name: 'api_key') String apiKey,
    @required @JsonKey(name: 'base_url') String baseUrl,
  }) = _Secret;
  factory Secret.fromJson(Map<String, dynamic> json) => _$SecretFromJson(json);
}
