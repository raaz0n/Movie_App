import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/screen/home/movie_carousel/movie_page_view.dart';
import 'package:movie_app/presentation/widgets/movie_appbar.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';

class MovieCarouselWidget extends StatefulWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget(
      {Key? key, required this.movies, required this.defaultIndex})
      : super(key: key);

  @override
  State<MovieCarouselWidget> createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
                movies: widget.movies, initialPage: widget.defaultIndex),
            const MovieDataWidget(),
          ],
        )
      ],
    );
  }
}
