import 'package:flutter/material.dart';

import '../core/presentation_utils.dart';
//import 'widgets/feature_movie.dart';
import 'widgets/movies_list.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: MoviesList(),
      ),
    );
  }
}
