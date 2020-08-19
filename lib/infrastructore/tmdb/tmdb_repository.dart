import 'dart:convert';

import 'package:TMDBFlutter/domain/tmdb/I_tmdb_repository.dart';
import 'package:TMDBFlutter/domain/tmdb/movie/movie.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:http/http.dart' as http;

import '../secret_loader.dart';

@LazySingleton(as: ITMDBRepository)
class TMDBRepository implements ITMDBRepository {
  final http.Client _httpClient;

  TMDBRepository() : _httpClient = http.Client();
  @override
  Future<KtList<Movie>> fetchMovies({int page = 1}) async {
    final secret = await SecretLoader.load;
    final List<Movie> movies = [];
    final url =
        "${secret.baseUrl}/movie/popular?api_key=${secret.apiKey}&language=en-US&page=$page";
    final response = await _httpClient.get(url);
    if (response.statusCode != 200) {
      throw new Exception('There was a problem');
    }
    final decodedJson = jsonDecode(response.body);
    (decodedJson['results'] as List).forEach((element) {
      movies.add(Movie.fromJson(element));
    });

    return KtList.from(movies);
  }
}
