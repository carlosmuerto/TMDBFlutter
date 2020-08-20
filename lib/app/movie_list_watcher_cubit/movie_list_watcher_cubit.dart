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
  int _page = 1;

  MovieListWatcherCubit(this._tMDBRepository) : super(_Initial());

  void loadMovies({@required String language}) async {
    emit(_LoadInProgress());
    final movielistOrF = await _tMDBRepository.fetchMovies(page: _page, language: language);
    movielistOrF.fold((f) => print(f), (movielist) {
      /*
      for (var movie in movielist.iter) {
        print(movie.title);
      }
      */
      emit(_LoadSuccess(movies: movielist));
    });
  }
}
/*
              FlatButton(
                onPressed: () async {
                  final movielistOrF = await TMDBRepository()
                      .fetchMovies(language: Localizations.localeOf(context).languageCode);
                  movielistOrF.fold((f) => print(f), (movielist) {
                    for (var movie in movielist.iter) {
                      print(movie.title);
                    }
                  });
                },
                child: Icon(Icons.developer_mode),
              )
              */
