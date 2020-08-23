/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/selected_movie_cubit/selected_movie_cubit.dart';

class FeatureMovie extends StatelessWidget {
  const FeatureMovie({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedMovieCubit, SelectedMovieState>(
      builder: (context, state) => state.when(
        notLoaded: () => Container(),
        loaded: (loadedState) => Container(
          child: Image.network(
            loadedState.posterPath.getOrCrash(),
          ),
        ),
        error: (errorState) => Container(),
      ),
    );
  }
}
*/
