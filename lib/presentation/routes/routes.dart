import 'package:auto_route/auto_route_annotations.dart';

import '../movie_list/movie_list_page.dart';
import '../splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: MovieListPage),
  ],
)
class $Router {}
