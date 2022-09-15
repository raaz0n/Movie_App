import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/dependency_injection/get_it.dart';
import 'package:movie_app/presentation/bloc/movie_detail/movie_detail_bloc_bloc.dart';
import 'package:movie_app/presentation/screen/movie_detail/movie_detail_argument.dart';

import '../../../common/constants/size_constant.dart';
import '../../widgets/big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDetailArguments movieDetailArguments;
  MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBlocBloc movieDetailBlocBloc;
  @override
  void initState() {
    movieDetailBlocBloc = getItInstance<MovieDetailBlocBloc>();
    movieDetailBlocBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArguments.movieId));
    super.initState();
  }

  @override
  void dispose() {
    movieDetailBlocBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("-------------****" + widget.movieDetailArguments.movieId.toString());
    return Scaffold(
      body: BlocProvider<MovieDetailBlocBloc>.value(
        value: movieDetailBlocBloc,
        child: BlocBuilder<MovieDetailBlocBloc, MovieDetailBlocState>(
          builder: (context, state) {
            if (state is MovieDetailBlocLoaded) {
              final movieData = state.movieDetailsEntity;
              log(movieData.toString());
              return Column(
                children: [
                  BigPoster(
                    movie: movieData,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            getProportionateScreenWidth(Sizes.dimen_12)),
                    child: Text(
                      movieData.overview,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          wordSpacing: 1.2,
                          letterSpacing: 1.1),
                    ),
                  )
                ],
              );
            } else if (state is MovieDetailBlocError) {
              return Container();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
