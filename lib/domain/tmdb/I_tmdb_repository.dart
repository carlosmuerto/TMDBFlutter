import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'Movie_repository_failure.dart';
import 'movie/movie.dart';

abstract class ITMDBRepository {
  Future<Either<MovieRepositoryFailure, KtList<Movie>>> fetchMovies({int page = 1});

  //Future<MovieDetails> fetchMovieDetails({int id});
  //Future<KtList<Cast>> fetchMovieCast({int id});
}
