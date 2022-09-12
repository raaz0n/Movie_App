import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

import 'home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      locale: Locale(Languages.languages[1].code),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
