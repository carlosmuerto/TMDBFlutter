import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

import '../../domain/tmdb/I_tmdb_repository.dart';
import '../../domain/tmdb/Movie_repository_failure.dart';
import '../../domain/tmdb/movie/movie.dart';
import '../core/secret_loader.dart';
import 'dtos/movie/movie_dto.dart';

@LazySingleton(as: ITMDBRepository)
class TMDBRepository implements ITMDBRepository {
  final Dio _dio;

  static final String _baseUrl = "https://api.themoviedb.org/3/";
  static final String _imageBaseUrl = "http://image.tmdb.org/t/p/w500";

  @override
  String get baseUrl => _baseUrl;

  @override
  String get imageBaseUrl => _imageBaseUrl;

  TMDBRepository()
      : _dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ));
  @override
  Future<Either<MovieRepositoryFailure, KtList<Movie>>> fetchMovies({
    @required int page,
    @required String language,
  }) async {
    final List<Movie> movies = [];
    final String apikey = SecretLoader.shared.secret.apiKey;
    final response =
        await _dio.get("/movie/popular?api_key=$apikey&language=$language-US&page=$page");

    if (response.statusCode != 200) {
      return left(MovieRepositoryFailure.unexpected());
    }

    (response.data['results'] as List).forEach((element) {
      movies.add(MovieDto.fromJson(element).toDomain(imageBaseUrl: imageBaseUrl));
    });

    return right(KtList.from(movies));
  }
}
