import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_company_dto.freezed.dart';
part 'production_company_dto.g.dart';

@freezed
abstract class ProductionCompanyDto implements _$ProductionCompanyDto {
  const factory ProductionCompanyDto({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "logo_path") dynamic logoPath,
    @JsonKey(name: "name") String name,
    @JsonKey(name: "origin_country") String originCountry,
  }) = _ProductionCompanyDto;
  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDtoFromJson(json);
}
