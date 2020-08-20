import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import '../../generated/l10n.dart';
import '../../injection.dart';
import '../routes/routes.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<MovieListWatcherCubit>()),
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
