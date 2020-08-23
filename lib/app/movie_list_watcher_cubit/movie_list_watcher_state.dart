part of 'movie_list_watcher_cubit.dart';

@freezed
abstract class MovieListWatcherState with _$MovieListWatcherState {
  const factory MovieListWatcherState.inital() = _Initial;
  const factory MovieListWatcherState.loadInProgress() = _LoadInProgress;
  const factory MovieListWatcherState.loadSuccess(
      {@required KtList<Movie> movies, @required int page}) = _LoadSuccess;
  const factory MovieListWatcherState.loadFailure({@required MovieRepositoryFailure failure}) =
      _LoadFailure;
}
