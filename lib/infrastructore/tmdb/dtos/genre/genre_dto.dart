import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_dto.freezed.dart';
part 'genre_dto.g.dart';

@freezed
abstract class GenreDto with _$GenreDto {
  const factory GenreDto({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "name") String name,
  }) = _GenreDto;

  factory GenreDto.fromJson(Map<String, dynamic> json) => _$GenreDtoFromJson(json);
}
