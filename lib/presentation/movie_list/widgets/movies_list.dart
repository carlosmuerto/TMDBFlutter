import 'package:TMDBFlutter/domain/tmdb/movie/movie.dart';
import 'package:TMDBFlutter/generated/l10n.dart';
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
  final _startLoadingDistance = 5;
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
    _pageController.addListener(
      () {
        context.bloc<MovieListWatcherCubit>().state.maybeWhen(
              loadSuccess: (movies, page) {
                if (_pageController.page > (movies.size - _startLoadingDistance)) {
                  context.bloc<MovieListWatcherCubit>().loadMovies(
                        language: Localizations.localeOf(context).languageCode,
                      );
                }
              },
              orElse: () {},
            );
      },
    );
  }

  _goToPage(int page) {
    //print(page);
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
          orElse: () => _SomeErrorHappend(),
        );
      },
    );
  }
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

class _SomeErrorHappend extends StatelessWidget {
  const _SomeErrorHappend({
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
