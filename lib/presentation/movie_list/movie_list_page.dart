import 'package:TMDBFlutter/app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import 'package:TMDBFlutter/presentation/core/presentation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListWatcherCubit, MovieListWatcherState>(
      builder: (context, state) {
        return state.maybeMap<Widget>(
          loadSuccess: (loadSuccessState) {
            return Scaffold(
              body: Center(
                child: Text(loadSuccessState.movies[0].title),
              ),
            );
          },
          orElse: () => SomeErrorHameScaffold(),
        );
      },
    );
  }
}

class SomeErrorHameScaffold extends StatelessWidget {
  const SomeErrorHameScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(context.s.movie),
      ),
    );
  }
}
