import 'package:TMDBFlutter/app/selected_movie_cubit/selected_movie_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;

import '../../app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import '../../generated/l10n.dart';
import '../../injection.dart';
import '../routes/routes.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(ui.window.locale.languageCode); SelectedMovieCubit
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SelectedMovieCubit>()),
        BlocProvider(
            create: (context) => getIt<MovieListWatcherCubit>()
              ..loadMovies(language: ui.window.locale.languageCode)),
      ],
      child: MaterialApp(
        title: 'TMDBFlutter',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: ExtendedNavigator(
          router: Router(),
        ),
      ),
    );
  }
}
