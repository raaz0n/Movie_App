import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/dependency_injection/get_it.dart' as getIt;

void main() async {
  unawaited(getIt.init());
  ApiClient apiClient = ApiClient(Client());

  GetPlayingNow getPlayingNow = getIt.getItInstance<GetPlayingNow>();
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getPlayingNow(NoParams());

  eitherResponse.fold((l) {
    print("error occur");
    print(l);
  }, (r) {
    print("Movies Lists ");
    print(r);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
