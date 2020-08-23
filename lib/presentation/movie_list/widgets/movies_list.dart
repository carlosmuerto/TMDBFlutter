import 'package:TMDBFlutter/domain/tmdb/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../app/movie_list_watcher_cubit/movie_list_watcher_cubit.dart';
import '../../core/presentation_utils.dart';

class MoviesList extends StatefulWidget {
  MoviesList({
    Key key,
  }) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  int index = 0;
  final scrollThreshold = 200;

  static const _scrollThreshold = 200;
  PageController _buttonPageController = PageController(
    initialPage: 0,
    viewportFraction: .2,
  );
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  initState() {
    super.initState();
  }

  _goToPage(int page) {
    print(page);
    _buttonPageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListWatcherCubit, MovieListWatcherState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (movies, pages) {
            var children = <Widget>[];
            var buttonChildren = <Widget>[];
            for (var movie in movies.iter) {
              children.add(
                _PageViewChildren(
                  movie: movie,
                  showDetails: true,
                ),
              );

              buttonChildren.add(
                _PageViewChildren(
                  movie: movie,
                  onTap: () {
                    _goToPage(movies.indexOf(movie));
                  },
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: children,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _buttonPageController,
                      scrollDirection: Axis.horizontal,
                      children: buttonChildren,
                    ),
                  ),
                ),
              ],
            );
          },
          orElse: () => SomeErrorHappend(),
        );
      },
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListWatcherCubit, MovieListWatcherState>(
      builder: (context, state) => state.maybeWhen<Widget>(
        loadSuccess: (movies, page) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.blue,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.size + 1,
                  onPageChanged: (index) {
                    /*
                    _buttonPageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    */
                  },
                  itemBuilder: (context, index) {
                    if (index >= movies.size) {
                      return Center(
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    } else {
                      return Stack(
                        children: [
                          Center(
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          Expanded(
                            child: FadeInImage.memoryNetwork(
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              placeholder: kTransparentImage,
                              image: movies[index].posterPath.getOrCrash(),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: PageView.builder(
                  itemCount: movies.size + 1,
                  onPageChanged: (i) {
                    /*
                    _pageController.animateToPage(
                      i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    */
                  },
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  controller: _buttonPageController,
                  itemBuilder: (context, index) {
                    if (index >= movies.size) {
                      return Center(
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          _buttonPageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          //print(movies[index].title.getOrCrash());
                        },
                        child: Container(
                          width: context.mediaQuery.size.width * 0.2,
                          child: FadeInImage.memoryNetwork(
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            placeholder: kTransparentImage,
                            image: movies[index].posterPath.getOrCrash(),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        orElse: () => SomeErrorHappend(),
      ),
    );
  }
  */
}

class _PageViewChildren extends StatelessWidget {
  const _PageViewChildren({
    Key key,
    @required this.movie,
    this.onTap,
    this.showDetails = false,
  }) : super(key: key);

  final Movie movie;
  final VoidCallback onTap;
  final bool showDetails;
  final double _titleFountSize = 20;
  final double _titleFountStrokeWidth = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQuery.size.width,
      child: Stack(
        children: [
          Center(
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              placeholder: kTransparentImage,
              image: movie.posterPath.getOrCrash(),
            ),
          ),
          if (showDetails) ...[
            Positioned(
                left: context.mediaQuery.padding.left + 8,
                bottom: 8,
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      movie.title.getOrCrash(),
                      style: TextStyle(
                        fontSize: _titleFountSize,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = _titleFountStrokeWidth
                          ..color = Colors.black87,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      movie.title.getOrCrash(),
                      style: TextStyle(
                        fontSize: _titleFountSize,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                )),
          ],
        ],
      ),
    );
  }
}

class SomeErrorHappend extends StatelessWidget {
  const SomeErrorHappend({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      alignment: Alignment.center,
      child: Text(
        context.s.someErrorHappend,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
