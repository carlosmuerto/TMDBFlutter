import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    @Default(false) bool adult,
    @Default("") @JsonKey(name: 'backdrop_path') String backdropPath,
    @Default([]) @JsonKey(name: 'genre_ids') List<int> genreIds,
    @Default(-1) int id,
    @Default("") @JsonKey(name: 'original_language') String originalLanguage,
    @Default("") @JsonKey(name: 'original_title') String originalTitle,
    @Default("") String overview,
    @Default(0.0) double popularity,
    @Default("") @JsonKey(name: 'poster_path') String posterPath,
    @Default("") @JsonKey(name: 'release_date') String releaseDate,
    @Default("") String title,
    @Default(false) bool video,
    @Default(0.0) @JsonKey(name: 'vote_average') double voteAverage,
    @Default(0) @JsonKey(name: 'vote_count') int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
