import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_country_dto.freezed.dart';
part 'production_country_dto.g.dart';

@freezed
abstract class ProductionCountryDto implements _$ProductionCountryDto {
  const factory ProductionCountryDto({
    @JsonKey(name: "iso_3166_1") String iso31661,
    @JsonKey(name: "name") String name,
  }) = _ProductionCountryDto;
  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryDtoFromJson(json);
}
