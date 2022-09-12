import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/presentation/bloc/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/screen/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app/presentation/screen/home/movie_tabbed/tab_title_widget.dart';

import '../../../../common/constants/size_constant.dart';
import 'movie_list_view_builder.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentIndex = 0;

  @override
  void initState() {
    movieTabbedBloc.add(MovieTabChangedEvent(currentIndex: currentIndex));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.only(top: getProportionateScreenHeight(Sizes.dimen_4)),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      onTap: () => _onTabChanged(i),
                      title: MovieTabbedConstants.movieTabs[i].title,
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(child: MovieListViewBuilder(movies: state.movies))
            ],
          ),
        );
      },
    );
  }

  _onTabChanged(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentIndex: index));
  }
}
