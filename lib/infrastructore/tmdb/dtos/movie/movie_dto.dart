import 'dart:core';

import 'package:TMDBFlutter/domain/tmdb/movie/movie.dart';
import 'package:TMDBFlutter/domain/tmdb/movie/movie_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../genre/genre_dto.dart';
import '../production_company/production_company_dto.dart';
import '../production_country/production_country_dto.dart';
import '../spoken_language/spoken_language_dto.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
abstract class MovieDto implements _$MovieDto {
  const factory MovieDto({
    @JsonKey(name: "adult") bool adult,
    @JsonKey(name: "backdrop_path") String backdropPath,
    @JsonKey(name: "belongs_to_collection") dynamic belongsToCollection,
    @JsonKey(name: "budget") int budget,
    @JsonKey(name: "genres") List<GenreDto> genres,
    @JsonKey(name: "homepage") String homepage,
    @JsonKey(name: "id") int id,
    @JsonKey(name: "imdb_id") String imdbId,
    @JsonKey(name: "original_language") String originalLanguage,
    @JsonKey(name: "original_title") String originalTitle,
    @JsonKey(name: "overview") String overview,
    @JsonKey(name: "popularity") double popularity,
    @JsonKey(name: "poster_path") String posterPath,
    @JsonKey(name: "production_companies") List<ProductionCompanyDto> productionCompanies,
    @JsonKey(name: "production_countries") List<ProductionCountryDto> productionCountries,
    @JsonKey(name: "release_date") DateTime releaseDate,
    @JsonKey(name: "revenue") int revenue,
    @JsonKey(name: "runtime") int runtime,
    @JsonKey(name: "spoken_languages") List<SpokenLanguageDto> spokenLanguages,
    @JsonKey(name: "status") String status,
    @JsonKey(name: "tagline") String tagline,
    @JsonKey(name: "title") String title,
    @JsonKey(name: "video") bool video,
    @JsonKey(name: "vote_average") double voteAverage,
    @JsonKey(name: "vote_count") int voteCount,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);

  factory MovieDto.fromDomain(Movie movie) => MovieDto(
        title: movie.title.getOrCrash(),
      );

  Movie toDomain() => Movie(title: ValidTitle(title));
}
