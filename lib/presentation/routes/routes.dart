import 'package:auto_route/auto_route_annotations.dart';

import '../splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SplashPage, initial: true),
  ],
)
class $Router {}
