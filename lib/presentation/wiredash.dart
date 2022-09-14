import 'package:flutter/material.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WireDashApp(
      {Key? key,
      required this.navigatorKey,
      required this.child,
      required this.languageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "movie-2o9bdbq",
      secret: "viGT9SdBT3MabGZBC8RPU6fjWu7AWbPN",
      options: WiredashOptionsData(
          // locale: Locale.fromSubtags(
          //   languageCode: languageCode,
          // ),
          locale: Locale(languageCode)),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
      ),
      child: child,
    );
  }
}
