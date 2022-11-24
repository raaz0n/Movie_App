import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/dependency_injection/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive/hive.dart';

import 'data/tables/movie_table.dart';
import 'presentation/screen/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(getIt.init());
  final appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovietableAdapter());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(((_) {
    runApp(const MovieApp());
  }));
}
