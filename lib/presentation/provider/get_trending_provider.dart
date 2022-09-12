// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:movie_app/domain/entities/movie_entity.dart';
// import 'package:movie_app/domain/entities/no_params.dart';
// import 'package:movie_app/domain/usecases/get_trending.dart';

// class GetTrendingProvider extends ChangeNotifier {
//   GetTrending getTrending;
//   GetTrendingProvider(this.getTrending);

//   List<MovieEntity> _trendingMovieList = [];
//   List<MovieEntity> get trendingMovieList => _trendingMovieList;

//   Future<void> GetTrendingData() async {
//     final response = await getTrending.call(NoParams());

//     response.fold((l) => throw Error(), (trendingMovieList) {
//       _trendingMovieList = trendingMovieList;
//       log(_trendingMovieList.toString());
//       notifyListeners();
//     });
//   }
// }
