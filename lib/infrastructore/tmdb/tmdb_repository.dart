import 'package:TMDBFlutter/domain/tmdb/I_tmdb_repository.dart';
import 'package:TMDBFlutter/domain/tmdb/Movie_repository_failure.dart';
import 'package:TMDBFlutter/domain/tmdb/movie/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import '../core/secret_loader.dart';

@LazySingleton(as: ITMDBRepository)
class TMDBRepository implements ITMDBRepository {
  final Dio _dio;

  TMDBRepository()
      : _dio = Dio(BaseOptions(
          baseUrl: SecretLoader.shared.secret.baseUrl,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ));
  @override
  Future<Either<MovieRepositoryFailure, KtList<Movie>>> fetchMovies({int page = 1}) async {
    final List<Movie> movies = [];
    final response = await _dio.get(
        "/movie/popular?api_key=${SecretLoader.shared.secret.apiKey}&language=en-US&page=$page");

    if (response.statusCode != 200) {
      return left(MovieRepositoryFailure.unexpected());
    }

    (response.data['results'] as List).forEach((element) {
      movies.add(Movie.fromJson(element));
    });

    return right(KtList.from(movies));
  }
}
