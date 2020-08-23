// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'infrastructore/core/interceptor/dio_connectivity_request_retrier.dart';
import 'domain/tmdb/I_tmdb_repository.dart';
import 'app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import 'injection.dart';
import 'infrastructore/core/interceptor/retry_interceptor.dart';
import 'infrastructore/core/secret_loader.dart';
import 'app/selected_movie_cubit/selected_movie_cubit.dart';
import 'infrastructore/tmdb/tmdb_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<Connectivity>(() => registerModule.connectivity);
  gh.factory<DioConnectivityRequestRetrier>(
      () => DioConnectivityRequestRetrier(connectivity: get<Connectivity>()));
  gh.lazySingleton<ITMDBRepository>(() => TMDBRepository());
  gh.factory<MovieListWatcherCubit>(
      () => MovieListWatcherCubit(get<ITMDBRepository>()));
  gh.factory<RetryOnConnectionChangeInterceptor>(() =>
      RetryOnConnectionChangeInterceptor(get<DioConnectivityRequestRetrier>()));
  gh.factory<SelectedMovieCubit>(
      () => SelectedMovieCubit(get<ITMDBRepository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<SecretLoader>(SecretLoader());
  return get;
}

class _$RegisterModule extends RegisterModule {
  @override
  Connectivity get connectivity => Connectivity();
}
