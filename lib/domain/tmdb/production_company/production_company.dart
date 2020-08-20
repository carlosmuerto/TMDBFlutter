import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_company.freezed.dart';
part 'production_company.g.dart';

@freezed
abstract class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "logo_path") dynamic logoPath,
    @JsonKey(name: "name") String name,
    @JsonKey(name: "origin_country") String originCountry,
  }) = _ProductionCompany;
  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}
