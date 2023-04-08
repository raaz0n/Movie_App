import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/dependency_injection/get_it.dart';
import 'package:movie_app/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/wiredash.dart';

import 'home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageBloc languageBloc;

  @override
  void initState() {
    languageBloc = getItInstance<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>.value(
      value: languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageChanged) {
            log(state.toString());
            return WireDashApp(
              languageCode: state.locale.languageCode,
              navigatorKey: _navigatorKey,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: "Movie App",
                theme: ThemeData(
                  useMaterial3: true,
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  // textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (locale.languageCode == deviceLocale!.languageCode &&
                        locale.countryCode == deviceLocale.countryCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.last;
                },
                home: const HomeScreen(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
