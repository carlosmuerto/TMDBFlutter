import '../../domain/tmdb/Movie_repository_failure.dart';
import '../../domain/tmdb/movie/movie.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'movie_list_watcher_state.dart';
part 'movie_list_watcher_cubit.freezed.dart';

class MovieListWatcherCubit extends Cubit<MovieListWatcherState> {
  MovieListWatcherCubit() : super(_Initial());
}
