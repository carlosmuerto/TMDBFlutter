import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_country.freezed.dart';
part 'production_country.g.dart';

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: "iso_3166_1") String iso31661,
    @JsonKey(name: "name") String name,
  }) = _ProductionCountry;
  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}
