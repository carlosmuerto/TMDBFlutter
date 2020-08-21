import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

import 'Movie_repository_failure.dart';
import 'movie/movie.dart';

abstract class ITMDBRepository {
  String get imageBaseUrl;
  String get baseUrl;
  Future<Either<MovieRepositoryFailure, KtList<Movie>>> fetchMovies({
    @required int page,
    @required String language,
  });

  //Future<MovieDetails> fetchMovieDetails({int id});
  //Future<KtList<Cast>> fetchMovieCast({int id});
}
