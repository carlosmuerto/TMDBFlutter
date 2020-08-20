import 'package:TMDBFlutter/domain/tmdb/movie/movie_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({@required ValidTitle title}) = _Movie;
}
