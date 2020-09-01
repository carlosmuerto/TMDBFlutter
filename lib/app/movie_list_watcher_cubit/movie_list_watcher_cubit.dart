import 'package:TMDBFlutter/domain/tmdb/I_tmdb_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/tmdb/Movie_repository_failure.dart';
import '../../domain/tmdb/movie/movie.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'movie_list_watcher_state.dart';
part 'movie_list_watcher_cubit.freezed.dart';

@injectable
class MovieListWatcherCubit extends Cubit<MovieListWatcherState> {
  final ITMDBRepository _tMDBRepository;

  bool canload = true;

  MovieListWatcherCubit(this._tMDBRepository) : super(_Initial());

  void loadMovies({@required String language}) async {
    if (canload) {
      int page;
      List<Movie> movies = [];
      canload = false;
      this.state.maybeWhen(
        loadSuccess: (movieKtListLoaded, pageLoaded) {
          page = pageLoaded + 1;
          movies.addAll(movieKtListLoaded.iter);
        },
        orElse: () {
          page = 1;
        },
      );

      final movielistOrF = await _tMDBRepository.fetchMovies(page: page, language: language);
      canload = true;
      movielistOrF.fold((f) => print(f), (movieKtList) {
        movies.addAll(movieKtList.iter);
        emit(
          _LoadSuccess(
            movies: KtList.from({...movies}),
            page: page,
          ),
        );
      });
    }
  }
}
