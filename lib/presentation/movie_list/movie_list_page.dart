import '../../app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import '../core/presentation_utils.dart';
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
              body: Padding(
                padding: EdgeInsets.only(top: context.mediaQuery.padding.top),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      loadSuccessState.movies[0].posterPath.getOrCrash(),
                    ),
                    Text(loadSuccessState.movies[0].title.getOrCrash()),
                  ],
                ),
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
