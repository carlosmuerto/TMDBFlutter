import 'package:TMDBFlutter/app/selected_movie_cubit/selected_movie_cubit.dart';
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
    return BlocListener<MovieListWatcherCubit, MovieListWatcherState>(
      listener: (BuildContext context, state) {
        state.maybeWhen(
          inital: () {},
          loadSuccess: (movies, page) {
            context.bloc<SelectedMovieCubit>().showMovie(movie: movies[0]);
            return context.navigator.replace(Routes.movieListPage);
          },
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
