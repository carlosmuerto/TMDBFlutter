import 'package:kt_dart/kt.dart';

import 'movie/movie.dart';

abstract class ITMDBRepository {
  Future<KtList<Movie>> fetchMovies({int page = 1});

  //Future<MovieDetails> fetchMovieDetails({int id});
  //Future<KtList<Cast>> fetchMovieCast({int id});
}
