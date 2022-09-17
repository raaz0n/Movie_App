import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';

import '../../../dependency_injection/get_it.dart';
import '../../bloc/favorite_bloc/favorite_bloc.dart';
import 'favorite_movie_grid_view.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteBloc>();
    _favoriteBloc.add(LoadFavoriteMovieEvent());
  }

  @override
  void dispose() {
    _favoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate(TranslationConstants.favoriteMovies).toString(),
        ),
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteMovieLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                   AppLocalizations.of(context)!.translate(TranslationConstants.noFavoriteMovie).toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies: state.movies,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
