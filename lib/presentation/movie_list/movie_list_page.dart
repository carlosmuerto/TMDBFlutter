import 'package:TMDBFlutter/presentation/core/presentation_utils.dart';
import 'package:flutter/material.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key key}) : super(key: key);

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
