import 'package:TMDBFlutter/domain/tmdb/movie/movie.dart';
import 'package:TMDBFlutter/generated/l10n.dart';
import 'package:TMDBFlutter/presentation/core/widget/common.dart';
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
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
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
                      //physics: NeverScrollableScrollPhysics(),
                      controller: _buttonPageController,
                      scrollDirection: Axis.horizontal,
                      children: buttonChildren,
                      onPageChanged: _goToPage,
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

  final double _overviewFountSize = 14;
  final double _overviewFountStrokeWidth = 6;

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
              left: 0,
              bottom: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      width: context.mediaQuery.size.width,
                      child: BorderedText(
                        title: movie.title.getOrCrash(),
                        fountSize: _titleFountSize,
                        fountStrokeWidth: _titleFountStrokeWidth,
                      ),
                    ),
                    Container(
                      width: context.mediaQuery.size.width,
                      padding: EdgeInsets.all(8),
                      child: BorderedText(
                        title: movie.overview.getOrCrash(),
                        fountSize: _overviewFountSize,
                        fountStrokeWidth: _overviewFountStrokeWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
