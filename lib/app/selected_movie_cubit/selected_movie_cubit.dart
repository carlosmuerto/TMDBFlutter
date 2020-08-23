import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/tmdb/I_tmdb_repository.dart';
import '../../domain/tmdb/Movie_repository_failure.dart';
import '../../domain/tmdb/movie/movie.dart';

part 'selected_movie_cubit.freezed.dart';
part 'selected_movie_state.dart';

@injectable
class SelectedMovieCubit extends Cubit<SelectedMovieState> {
  final ITMDBRepository _tMDBRepository;
  SelectedMovieCubit(this._tMDBRepository) : super(_NotLoaded());

  void showMovie({@required Movie movie}) {
    emit(_Loaded(movie: movie));
  }

  void loadMovie({@required int movieId}) {}
}
