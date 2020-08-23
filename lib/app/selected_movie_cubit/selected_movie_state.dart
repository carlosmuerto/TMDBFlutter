part of 'selected_movie_cubit.dart';

@freezed
abstract class SelectedMovieState with _$SelectedMovieState {
  const factory SelectedMovieState.notLoaded() = _NotLoaded;
  const factory SelectedMovieState.loaded({@required Movie movie}) = _Loaded;
  const factory SelectedMovieState.error({@required MovieRepositoryFailure failure}) = _Error;
}
