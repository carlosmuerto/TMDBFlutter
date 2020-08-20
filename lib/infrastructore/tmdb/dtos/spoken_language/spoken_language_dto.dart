import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_dto.freezed.dart';
part 'spoken_language_dto.g.dart';

@freezed
abstract class SpokenLanguageDto implements _$SpokenLanguageDto {
  const factory SpokenLanguageDto({
    @JsonKey(name: "iso_639_1") String iso6391,
    @JsonKey(name: "name") String name,
  }) = _SpokenLanguageDto;

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageDtoFromJson(json);
}
