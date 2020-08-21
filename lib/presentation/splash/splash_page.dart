import 'package:TMDBFlutter/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import '../core/presentation_utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.bloc<MovieListWatcherCubit>().state == MovieListWatcherState.inital()) {
      print("initial");
      context
          .bloc<MovieListWatcherCubit>()
          .loadMovies(language: Localizations.localeOf(context).languageCode);
    }
    return BlocListener<MovieListWatcherCubit, MovieListWatcherState>(
      listener: (BuildContext context, state) {
        state.maybeWhen(
          inital: () {},
          loadSuccess: (_, __) => context.navigator.replace(Routes.movieListPage),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(context.s.nowLoading),
            ],
          ),
        ),
      ),
    );
  }
}
